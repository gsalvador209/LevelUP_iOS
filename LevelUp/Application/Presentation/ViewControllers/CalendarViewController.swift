//
//  CalendarViewController.swift
//  LevelUp
//
//  Created by Salvador Chavez on 29/06/25.
//


import UIKit
import KVKCalendar
import Combine
import EventKit

class CalendarViewController: UIViewController {
 
    @IBOutlet weak var calendarContainer: UIView!
    private var calendarView : KVKCalendarView!
    
  // Inyección por lazy desde AppCoordinator o AppDelegate
    private lazy var viewModel: CalendarViewModel = {
        // Crea el repositorio usando tu CoreDataStack singleton
        let repo = TaskRepository(context: CoreDataStack.shared.context)
        return CalendarViewModel(taskRepository: repo)
    }()

  private var cancellables = Set<AnyCancellable>()
  private var events: [Event] = []
    private var currentVisibleDate: Date = Date()
    
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCalendar()
    bindViewModel()
    viewModel.fetchEvents(forWeekContaining: Date())
  }

    private func setupCalendar() {
        // 1) Configura el estilo
        var style = Style()
    
        style.defaultType  = .week
        style.startWeekDay = .monday
    
        // 2) Instancia el calendario con el frame inicial igual al del contenedor
        let cal = KVKCalendarView(frame: calendarContainer.bounds,
                                  style: style)
        cal.dataSource = self
        cal.delegate   = self

        
        // 3) Activa autoresizing para que se redimensione con el contenedor
        cal.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        // 4) Añádelo al container
        calendarContainer.addSubview(cal)

        // 5) Guarda la referencia
        self.calendarView = cal
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // 1) Ajustamos el frame de la vista al tamaño actual del contenedor
        calendarView.frame = calendarContainer.bounds
        // 2) Le pedimos a KVKCalendar que recalcule todo según el nuevo frame
        calendarView.reloadFrame(calendarContainer.bounds)
    }


      private func bindViewModel() {
        viewModel.$events
          .receive(on: RunLoop.main)
          .sink { [weak self] newEvents in
              print("🔔 [VC] eventos publicados:", newEvents.count)
            self?.events = newEvents
            self?.calendarView.reloadData()
          }
          .store(in: &cancellables)
      }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      // Usa la fecha actualmente visible del calendario, o Date() si no existe la propiedad
      viewModel.fetchEvents(forWeekContaining: currentVisibleDate)
    }

}

// MARK: – CalendarDataSource
extension CalendarViewController: CalendarDataSource {
  func eventsForCalendar(systemEvents: [EKEvent]) -> [Event] {
    // Ignoramos eventos de sistema y devolvemos los de nuestro ViewModel
      print("📅 [DataSource] devolviendo eventos:", events.count)
      
      for e in events {
            print("""
              • Event ID: \(e.ID)
                start: \(e.start)
                end:   \(e.end)
                isAllDay: \(e.isAllDay)
              """)
          }
    return events
  }
}

// MARK: – CalendarDelegate
extension CalendarViewController: CalendarDelegate {
  // Crear nueva tarea tocando un espacio vacío
  func didSelectDates(_ dates: [Date], type: CalendarType, frame: CGRect?) {
    guard let date = dates.first else { return }
    viewModel.startCreatingTask(deadline: date)
    // Ejemplo: abrir modal de nueva tarea con fecha límite = date
  }

func didSelectDate(_ date: Date, type: CalendarType, frame: CGRect?) {
    // Este callback se dispara al tocar un día en el header
    // Para cambiar el timeline a esa fecha:
    calendarView.set(type: .week, date: date)
    calendarView.reloadData()
  }
    
  // Editar tarea existente tocando un evento
  func didSelectEvent(_ event: Event, type: CalendarType, frame: CGRect?) {
    viewModel.startEditingTask(id: event.ID)
  }
    
func didScrollToDate(_ date: Date, type: CalendarType) {
    currentVisibleDate = date
    viewModel.fetchEvents(forWeekContaining: date)
  }
   
}


