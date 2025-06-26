//
//  AddTaskSheetViewController.swift
//  LevelUp
//
//  Created by Salvador Chavez on 25/06/25.
//
import UIKit

class AddTaskSheetViewController: UIViewController {
    // MARK: - IBOutlets (conéctalos desde el Storyboard)
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var toggleDescriptionButton: UIButton!
    @IBOutlet weak var scheduleButton: UIButton!
    @IBOutlet weak var recurrenceButton: UIButton!
    @IBOutlet weak var listSelectorField: UITextField!
    @IBOutlet weak var descriptionHeightConstraint: NSLayoutConstraint! //Para variar la altura
    
    @IBOutlet weak var saveButton: UIButton!

    // Repositorio
    private let taskRepo = TaskRepository()
    private let listRepo = ListRepository()
    
    //Listas
    private var lists : [ListEntity] = []
    private var selectedList : ListEntity?
    
    // MARK: - Estado interno
    private var descriptionVisible = false
    private var selectedDate: Date?


    // PICKER para la lista
    private lazy var listPicker: UIPickerView = {
        let p = UIPickerView()
        p.delegate = self
        p.dataSource = self
        return p
    }()
    
    
    
    //Placeholder para un hint en el UITextVIew
    private let placeholderLabel: UILabel = {
            let lbl = UILabel()
            lbl.text = "Escribe la descripción…"
            lbl.font = .italicSystemFont(ofSize: 16)
            lbl.textColor = .lightGray
            lbl.translatesAutoresizingMaskIntoConstraints = false
            return lbl
        }()

    // MARK: - Ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Listas
        listSelectorField.inputView = listPicker
        loadLists()
    
        
        //Bottom Sheet
        descriptionTextView.isHidden = true
        descriptionHeightConstraint.constant = 0
        saveButton.isEnabled = false

        // Delegados / targets
        titleTextField.addTarget(self, action: #selector(titleDidChange), for: .editingChanged)
        toggleDescriptionButton.addTarget(self, action: #selector(toggleDescription), for: .touchUpInside)
        scheduleButton.addTarget(self, action: #selector(presentDateTimePicker), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveTask), for: .touchUpInside)

        
        descriptionTextView.delegate = self
        descriptionTextView.addSubview(placeholderLabel)
            NSLayoutConstraint.activate([
                placeholderLabel.topAnchor.constraint(equalTo: descriptionTextView.topAnchor, constant: 8),
                placeholderLabel.leadingAnchor.constraint(equalTo: descriptionTextView.leadingAnchor, constant: 5),
                placeholderLabel.trailingAnchor.constraint(equalTo: descriptionTextView.trailingAnchor, constant: -5)
            ])
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: - Actions

    @objc private func titleDidChange() {
        saveButton.isEnabled = !(titleTextField.text?.isEmpty ?? true)
    }

    @objc private func toggleDescription() {
        descriptionVisible.toggle()
        descriptionTextView.isHidden = !descriptionVisible
        descriptionHeightConstraint.constant = descriptionVisible ? 50 : 0
        
        if #available(iOS 16, *) {
            sheetPresentationController?.animateChanges {
                sheetPresentationController?.selectedDetentIdentifier = descriptionVisible
                ? UISheetPresentationController.Detent.Identifier("medium")
                : UISheetPresentationController.Detent.Identifier("small")
            }
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
          }
    }

    @objc private func presentDateTimePicker() {
        let dtVC = DateTimePickerViewController()
        dtVC.onComplete = { date in
            self.selectedDate = date
            self.scheduleButton.setImage(
                UIImage(systemName: "calendar"), for: .normal)
        }
        let nav = UINavigationController(rootViewController: dtVC)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
    @objc private func saveTask() {
            guard let title = titleTextField.text, !title.isEmpty,
                  let list = selectedList else {
                // quizá muestra un alerta de “selecciona lista”
                return
            }
            let descText = descriptionVisible ? descriptionTextView.text : nil

            do {
              try taskRepo.addTask(
                title: title,
                description: descText,
                list: list,
                startDate: nil,
                deadline: selectedDate,
                reminders: nil
              )
                NotificationCenter.default.post(name: .taskAdded, object: nil)
                print("Se ha guardado la tarea \(title)")
                
            } catch {
              print("Error guardando tarea: \(error)")
            }
            dismiss(animated: true)
        }
    // MARK: - Keyboard Handling

//    @objc private func keyboardWillShow(notification: Notification) {
//        guard let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
//        // Movemos el contenido hacia arriba para que la sheet quede siempre visible
//        view.transform = CGAffineTransform(translationX: 0, y: -frame.height + view.safeAreaInsets.bottom)
//    }
//
//    @objc private func keyboardWillHide(notification: Notification) {
//        UIView.animate(withDuration: 0.3) {
//            self.view.transform = .identity
//        }
//    }

    // MARK: - Lista Picker Helpers
    private func loadLists(){
        do {
            lists = try listRepo.fetchAllLists()
            print("Se hallaron \(lists.count) listas")
            listPicker.reloadAllComponents()
            if let first = lists.first {
                selectedList = first
                listSelectorField.text = first.customName ?? first.type
                listPicker.selectRow(0, inComponent: 0, animated: false)
            }
        } catch {
            print("Error cargando listas: \(error)")
        }
    }
    
    @objc private func dismissListPicker() {
        listSelectorField.resignFirstResponder()
    }
    
    
//    
//    private func selectList(at index: Int) {
//        let list = lists[index]
//        selectedList = list[index]
//    }
    
    
    
}

// MARK: - UIPickerViewDelegate & DataSource


extension AddTaskSheetViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        // Oculta el placeholder si hay texto
        placeholderLabel.isHidden = !textView.text.isEmpty
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        // si quieres mover el detent a grande cuando empiecen a escribir
        if #available(iOS 16.0, *) {
            sheetPresentationController?.animateChanges {
                sheetPresentationController?.selectedDetentIdentifier = .large
            }
        }
    }
}

extension AddTaskSheetViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent comp: Int) -> Int {
        lists.count
    }
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int, forComponent comp: Int) -> String? {
        let list = lists[row]
        // mostramos el nombre custom o el type por defecto
        return list.customName ?? list.type
    }
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int, inComponent comp: Int) {
        let list = lists[row]
        selectedList = list
        listSelectorField.text = list.customName ?? list.type
    }
}
