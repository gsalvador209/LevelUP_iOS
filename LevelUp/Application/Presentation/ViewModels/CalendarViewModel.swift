//
//  CalendarViewModel.swift
//  LevelUp
//
//  Created by Salvador Chavez on 29/06/25.
//


import Foundation
import Combine
import KVKCalendar
import UIKit

class CalendarViewModel {
    @Published var events: [Event] = []
    private let taskRepository: TaskRepository
    private var cancellables = Set<AnyCancellable>()
    
    init(taskRepository: TaskRepository) {
        self.taskRepository = taskRepository
    }
    
    func fetchEvents(forWeekContaining date: Date) {
        // 1) Calcular inicio/fin de semana
        let (start, end) = date.weekBounds()

        // 2) Fetch en background
        DispatchQueue.global(qos: .userInitiated).async {
            
            var tasks: [TaskEntity] = []

                do {
                    tasks = try self.taskRepository.fetchTasks(from: start, to: end)
                } catch {
                    print("❌ Error al obtener tareas por fecha:", error)
                }

            // 3) Mapear a [Event], cada tarea dura 30m antes del deadline
            let evts = tasks.compactMap { task -> Event? in
                guard let deadline = task.deadline else { return nil }

                let startDate = deadline.addingTimeInterval(-30 * 60)
                var e = Event(ID: task.objectID.uriRepresentation().absoluteString)
                e.start    = startDate
                e.end      = deadline
                e.title    = TextEvent(
                    timeline: task.title!,
                    month:    task.title!,
                    list:     task.title!
                )
                e.color    = Event.Color(UIColor.systemBlue)

                return e
            }


            // 4) Publicar en el hilo principal
            DispatchQueue.main.async {
                self.events = evts
            }
        }
    }

        
    func startCreatingTask(deadline: Date) {
        // Navegar o presentar la pantalla de "Nueva tarea" pre-llenada
    }
    
    func startEditingTask(id: String) {
        // Navegar a detalle de tarea existente
    }
        
}
