//
//  DraggableStickerView.swift
//  LevelUp
//
//  Created by Salvador Chavez on 05/07/25.
//


import UIKit

// Ruta: LevelUp/Application/Presentation/Views/DraggableStickerView.swift
class DraggableStickerView: UIImageView, UIGestureRecognizerDelegate {
    
    var imageUrl: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGestures()
        isUserInteractionEnabled = true
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGestures()
        isUserInteractionEnabled = true
    }

    private func setupGestures() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate(_:)))
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap))
        doubleTap.numberOfTapsRequired = 2
        contentMode = .scaleAspectFit
        pan.delegate = self
        pinch.delegate = self
        rotate.delegate = self

        addGestureRecognizer(pan)
        addGestureRecognizer(pinch)
        addGestureRecognizer(rotate)
        addGestureRecognizer(doubleTap)
    }

    // 💡 Permitir simultaneidad
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        // Solo pan, pinch, rotate juntos
        return gestureRecognizer is UIPinchGestureRecognizer
            || gestureRecognizer is UIRotationGestureRecognizer
            || gestureRecognizer is UIPanGestureRecognizer
    }

    @objc private func handlePan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: superview)
        if let view = gesture.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
            gesture.setTranslation(.zero, in: superview)
        }
    }

    @objc private func handlePinch(_ gesture: UIPinchGestureRecognizer) {
        if let view = gesture.view {
            view.transform = view.transform.scaledBy(x: gesture.scale, y: gesture.scale)
            gesture.scale = 1.0
        }
    }

    @objc private func handleRotate(_ gesture: UIRotationGestureRecognizer) {
        if let view = gesture.view {
            view.transform = view.transform.rotated(by: gesture.rotation)
            gesture.rotation = 0
        }
    }

    @objc private func handleDoubleTap() {
        self.removeFromSuperview()
    }
}
