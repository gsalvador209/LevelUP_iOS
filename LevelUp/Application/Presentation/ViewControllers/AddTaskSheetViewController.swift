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
    @IBOutlet weak var listSelectorField: UITextField!  // usaremos UIPickerView como inputView
    @IBOutlet weak var saveButton: UIButton!

    // MARK: - Estado interno
    private var descriptionVisible = false
    private var selectedDate: Date?
    private var selectedListId: Int64?

    // Un simple array para ejemplos; en tu caso carga desde tu ViewModel
    private var lists: [(id: Int64, name: String)] = [(1, "Inbox"), (2, "Work"), (3, "Personal")]

    // PICKER para la lista
    private lazy var listPicker: UIPickerView = {
        let p = UIPickerView()
        p.delegate = self
        p.dataSource = self
        return p
    }()

    // MARK: - Ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()

        // Ocultamos la descripción al inicio
        descriptionTextView.isHidden = true
        saveButton.isEnabled = false

        // Delegados / targets
        titleTextField.addTarget(self, action: #selector(titleDidChange), for: .editingChanged)
        toggleDescriptionButton.addTarget(self, action: #selector(toggleDescription), for: .touchUpInside)
        scheduleButton.addTarget(self, action: #selector(presentDateTimePicker), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveTask), for: .touchUpInside)

        // Configuramos picker para el selector de lista
        listSelectorField.inputView = listPicker
        listSelectorField.placeholder = "Select a list"
        // Seleccion por defecto
        selectList(at: 0)

        // Observadores de teclado para mantener sheet arriba
//        NotificationCenter.default.addObserver(self,
//            selector: #selector(keyboardWillShow(notification:)),
//            name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self,
//            selector: #selector(keyboardWillHide(notification:)),
//            name: UIResponder.keyboardWillHideNotification, object: nil)
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
        if !descriptionVisible {
            descriptionTextView.text = ""
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
              let listId = selectedListId else { return }
        let descText = descriptionVisible ? descriptionTextView.text : nil

        // Aquí llamas a tu ViewModel/Repository (inyección en AppCoordinator)
        //TaskViewModel.shared.add(title: title, description: descText, listId: listId, deadline: selectedDate)

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

    private func selectList(at index: Int) {
        let item = lists[index]
        selectedListId = item.id
        listSelectorField.text = item.name
    }
}

// MARK: - UIPickerViewDelegate & DataSource

extension AddTaskSheetViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        lists.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        lists[row].name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectList(at: row)
    }
}
