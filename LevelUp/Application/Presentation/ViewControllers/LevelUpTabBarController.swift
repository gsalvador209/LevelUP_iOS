//
//  LevelUpTabBarController.swift
//  LevelUp
//
//  Created by Salvador Chavez on 24/06/25.
//


import UIKit
import CoreData

class LevelUpTabBarController: UITabBarController {
    
    //Boton para anãdir tareas
    private let addButton: UIButton = {
            let btn = UIButton(type: .system)
            
            btn.setImage(UIImage(systemName: "plus"), for: .normal)
            btn.tintColor = .white
            btn.backgroundColor = UIColor.systemBlue
            btn.layer.cornerRadius = 28    // mitad de tamaño para círculo
            btn.layer.shadowColor = UIColor.black.cgColor
            btn.layer.shadowOpacity = 0.3
            btn.layer.shadowOffset = CGSize(width: 0, height: 4)
            btn.layer.shadowRadius = 4
            btn.translatesAutoresizingMaskIntoConstraints = false
            return btn
        }()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddButton()
    }
    
    private func setupAddButton() {
        
            view.addSubview(addButton)

        
            NSLayoutConstraint.activate([
                addButton.widthAnchor.constraint(equalToConstant: 56),
                addButton.heightAnchor.constraint(equalToConstant: 56),
                // 16pt desde el borde derecho
                addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                // 10pt por encima de la UITabBar (topAnchor de la barra)
                addButton.bottomAnchor.constraint(equalTo: tabBar.topAnchor, constant: -20)
            ])

            
            addButton.addTarget(self, action: #selector(didTapAdd), for: .touchUpInside)
        }
    
    @objc private func didTapAdd() {
            let sb = UIStoryboard(name: "AddTaskSheet", bundle: nil)
            guard let sheetVC = sb.instantiateViewController(
                    withIdentifier: "AddTaskSheetViewController")
                  as? AddTaskSheetViewController else { return }
            sheetVC.modalPresentationStyle = .pageSheet
            if let sheet = sheetVC.sheetPresentationController {
                sheet.prefersGrabberVisible = true
                sheet.prefersScrollingExpandsWhenScrolledToEdge = false
                if #available(iOS 16.0, *) {
                    let small = UISheetPresentationController.Detent.custom(
                        identifier: .init("small")) { _ in 150 }
                    let large = UISheetPresentationController.Detent.custom(identifier: .init("medium")) { _ in 200}
                    sheet.detents = [small, large]
                    sheet.selectedDetentIdentifier = small.identifier
                } else {
                    sheet.detents = [.medium()]
                    sheet.selectedDetentIdentifier = .medium
                }
            }
            present(sheetVC, animated: true)
        }
    
    // Para hacer que el boton sea flotante y esté arriba de todo
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            view.bringSubviewToFront(addButton)
        }

}
