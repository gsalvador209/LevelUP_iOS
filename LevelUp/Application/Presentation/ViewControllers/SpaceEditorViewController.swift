//
//  SpaceEditorViewController.swift
//  LevelUp
//
//  Created by Salvador Chavez on 05/07/25.
//


// Ruta: LevelUp/Application/Presentation/ViewControllers/SpaceEditorViewController.swift

import UIKit

class SpaceEditorViewController: UIViewController {

    private let fondoImageView = UIImageView()
    private let btnAddSticker = UIButton(type: .system)
    // Guarda todos los stickers actuales (puedes serializar después)
    private var stickerViews: [DraggableStickerView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        fondoImageView.translatesAutoresizingMaskIntoConstraints = false
        fondoImageView.image = UIImage(named: "space_background") ?? UIImage(systemName: "photo") // tu imagen de fondo
        fondoImageView.contentMode = .scaleAspectFill
        fondoImageView.isUserInteractionEnabled = true
        view.addSubview(fondoImageView)

        btnAddSticker.translatesAutoresizingMaskIntoConstraints = false
        //btnAddSticker.setTitle("Añadir sticker", for: .normal)
        btnAddSticker.setImage(UIImage(systemName: "star.square"), for: .normal)
        btnAddSticker.tintColor = .white
        btnAddSticker.backgroundColor = UIColor(named: "colorPrimary") ?? .systemBlue
        btnAddSticker.layer.cornerRadius = 28
        btnAddSticker.clipsToBounds = true
        
        btnAddSticker.setTitle(nil, for: .normal)
        btnAddSticker.setTitleColor(nil, for: .normal)
        btnAddSticker.titleLabel?.font = nil
        
        
        btnAddSticker.addTarget(self, action: #selector(showStickerPicker), for: .touchUpInside)
        view.addSubview(btnAddSticker)

        NSLayoutConstraint.activate([
            fondoImageView.topAnchor.constraint(equalTo: view.topAnchor),
            fondoImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            fondoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            fondoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            btnAddSticker.widthAnchor.constraint(equalToConstant: 56),
            btnAddSticker.heightAnchor.constraint(equalToConstant: 56),
            btnAddSticker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            btnAddSticker.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
        
        loadStickersState()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        saveStickersState()
    }

    @objc private func showStickerPicker() {
        let picker = StickerPickerSheet()
        picker.modalPresentationStyle = .pageSheet
        picker.onStickerSelected = { [weak self] product in
            guard let self = self else { return }
            self.addSticker(product)
        }
        present(picker, animated: true)
    }

    private func addSticker(_ sticker: Product) {
        let stickerView = DraggableStickerView(frame: CGRect(x: 100, y: 100, width: 120, height: 120))
        if let url = sticker.imageUri, let imgUrl = URL(string: url) {
            stickerView.loadImage(from: imgUrl)
            stickerView.imageUrl = sticker.imageUri
        }
        stickerViews.append(stickerView)
        fondoImageView.addSubview(stickerView)
    }
}

extension SpaceEditorViewController {
    func saveStickersState() {
        var states: [StickerState] = []
        for view in fondoImageView.subviews {
            guard let sticker = view as? DraggableStickerView else { continue }
            let transform = sticker.transform
            let scale = sqrt(transform.a * transform.a + transform.c * transform.c)
            let rotation = atan2(transform.b, transform.a)
            let state = StickerState(
                stickerId: UUID().uuidString, // o usa sticker.stickerId si tienes uno real
                centerX: sticker.center.x,
                centerY: sticker.center.y,
                scale: scale,
                rotation: rotation,
                imageUrl: sticker.imageUrl ?? "" // usa sticker.stickerId o sticker.imageUrl real
            )
            states.append(state)
        }
        if let data = try? JSONEncoder().encode(states) {
            UserDefaults.standard.set(data, forKey: "space_stickers")
        }
    }
}


extension SpaceEditorViewController {
    func loadStickersState() {
        guard let data = UserDefaults.standard.data(forKey: "space_stickers"),
              let states = try? JSONDecoder().decode([StickerState].self, from: data) else { return }

        for state in states {
            let stickerView = DraggableStickerView(frame: CGRect(x: 0, y: 0, width: 120, height: 120))
            stickerView.imageUrl = state.imageUrl
            // Carga la imagen:
            if let url = URL(string: state.imageUrl) {
                stickerView.loadImage(from: url)
            }
            stickerView.center = CGPoint(x: state.centerX, y: state.centerY)
            stickerView.transform = CGAffineTransform.identity
                .scaledBy(x: state.scale, y: state.scale)
                .rotated(by: state.rotation)
            fondoImageView.addSubview(stickerView)
        }
    }
}

