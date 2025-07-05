import UIKit
import Combine
import PhotosUI

class ProfileViewController: UIViewController {

    private let imageView = UIImageView()
    private let nameField = UITextField()
    private let saveButton = UIButton(type: .system)
    private let goldLabel = UILabel()
    private let silverLabel = UILabel()

    private let viewModel = ProfileViewModel.shared
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        bindViewModel()
    }

    private func setupUI() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "default_user")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.backgroundColor = .secondarySystemBackground

        let imageTap = UITapGestureRecognizer(target: self, action: #selector(didTapImage))
        imageView.addGestureRecognizer(imageTap)

        nameField.translatesAutoresizingMaskIntoConstraints = false
        nameField.placeholder = "Tu nombre"
        nameField.borderStyle = .roundedRect

        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.setTitle("Guardar", for: .normal)
        saveButton.addTarget(self, action: #selector(didTapSave), for: .touchUpInside)

        goldLabel.translatesAutoresizingMaskIntoConstraints = false
        silverLabel.translatesAutoresizingMaskIntoConstraints = false
        goldLabel.font = .systemFont(ofSize: 16)
        silverLabel.font = .systemFont(ofSize: 16)

        view.addSubview(imageView)
        view.addSubview(nameField)
        view.addSubview(saveButton)
        view.addSubview(goldLabel)
        view.addSubview(silverLabel)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 80),

            nameField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24),
            nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),

            saveButton.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 16),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            goldLabel.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 32),
            goldLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            silverLabel.topAnchor.constraint(equalTo: goldLabel.bottomAnchor, constant: 12),
            silverLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

    private func bindViewModel() {
        viewModel.$name
            .receive(on: DispatchQueue.main)
            .assign(to: \.text!, on: nameField)
            .store(in: &cancellables)

        viewModel.$goldCoins
            .map { "🥇 Oro: \($0)" }
            .assign(to: \.text, on: goldLabel)
            .store(in: &cancellables)

        viewModel.$silverCoins
            .map { "🥈 Plata: \($0)" }
            .assign(to: \.text, on: silverLabel)
            .store(in: &cancellables)

        viewModel.$avatarUri
            .receive(on: DispatchQueue.main)
            .sink { [weak self] uri in
                guard let self = self else { return }
                if let uri = uri, let url = URL(string: uri) {
                    self.imageView.loadImage(from: url)
                } else {
                    self.imageView.image = UIImage(named: "default_user")
                }
            }
            .store(in: &cancellables)
    }

    @objc private func didTapSave() {
        let newName = nameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        if !newName.isEmpty {
            viewModel.saveName(newName)
        }
        
        if let uri = viewModel.avatarUri {
            viewModel.saveAvatar(uri: uri)
        }

        if let nav = navigationController {
            nav.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }

    @objc private func didTapImage() {
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.selectionLimit = 1
        config.filter = .images

        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        present(picker, animated: true)
    }
}

extension ProfileViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)

        guard let itemProvider = results.first?.itemProvider,
              itemProvider.canLoadObject(ofClass: UIImage.self) else { return }

        itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
            guard let self = self, let img = image as? UIImage else { return }

            DispatchQueue.main.async {
                self.imageView.image = img

                // Guardamos en local temporal para demo (luego implementar cache o persistencia real)
                if let data = img.jpegData(compressionQuality: 0.8) {
                    let filename = UUID().uuidString + ".jpg"
                    let url = FileManager.default.temporaryDirectory.appendingPathComponent(filename)
                    try? data.write(to: url)
                    self.viewModel.saveAvatar(uri: url.absoluteString)
                }
            }
        }
    }
}
