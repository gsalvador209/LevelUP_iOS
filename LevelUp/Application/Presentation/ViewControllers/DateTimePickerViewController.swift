import UIKit

class DateTimePickerViewController: UIViewController {
    var onComplete: ((Date) -> Void)?

    private let datePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.datePickerMode = .dateAndTime
        if #available(iOS 13.4, *) {
            dp.preferredDatePickerStyle = .wheels
        }
        dp.translatesAutoresizingMaskIntoConstraints = false
        return dp
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(datePicker)
        NSLayoutConstraint.activate([
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(title: "Done", style: .done,
                            target: self, action: #selector(done))
    }

    @objc private func done() {
        onComplete?(datePicker.date)
        dismiss(animated: true)
    }
}
