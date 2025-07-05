// Ruta: LevelUp/Application/Presentation/ViewControllers/SpaceRootViewController.swift

import UIKit

class SpaceRootViewController: UIViewController {
    private let btnStore = UIButton(type: .system)
    private let btnEditor = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        btnStore.setTitle("Tienda", for: .normal)
        btnStore.titleLabel?.font = .boldSystemFont(ofSize: 24)
        btnStore.backgroundColor = UIColor(named: "colorPrimary") ?? .systemBlue
        btnStore.setTitleColor(.white, for: .normal)
        btnStore.layer.cornerRadius = 16
        btnStore.translatesAutoresizingMaskIntoConstraints = false
        btnStore.addTarget(self, action: #selector(openStore), for: .touchUpInside)

        btnEditor.setTitle("Decorar espacio", for: .normal)
        btnEditor.titleLabel?.font = .boldSystemFont(ofSize: 24)
        btnEditor.backgroundColor = UIColor(named: "colorSecondary") ?? .systemGray
        btnEditor.setTitleColor(.white, for: .normal)
        btnEditor.layer.cornerRadius = 16
        btnEditor.translatesAutoresizingMaskIntoConstraints = false
        btnEditor.addTarget(self, action: #selector(openEditor), for: .touchUpInside)

        view.addSubview(btnStore)
        view.addSubview(btnEditor)

        NSLayoutConstraint.activate([
            btnStore.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnStore.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            btnStore.widthAnchor.constraint(equalToConstant: 250),
            btnStore.heightAnchor.constraint(equalToConstant: 70),

            btnEditor.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnEditor.topAnchor.constraint(equalTo: btnStore.bottomAnchor, constant: 32),
            btnEditor.widthAnchor.constraint(equalToConstant: 250),
            btnEditor.heightAnchor.constraint(equalToConstant: 70)
        ])
    }

    @objc private func openStore() {
        let storeVC = StoreViewController()
        navigationController?.pushViewController(storeVC, animated: true)
    }

    @objc private func openEditor() {
        let editorVC = SpaceEditorViewController()
        navigationController?.pushViewController(editorVC, animated: true)
    }
}
