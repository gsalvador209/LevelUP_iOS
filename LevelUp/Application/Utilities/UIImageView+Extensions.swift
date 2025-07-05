//
//  UIImageView+Extensions.swift
//  LevelUp
//
//  Created by Salvador Chavez on 04/07/25.
//

import UIKit

extension UIImageView {
    func loadImage(from url: URL) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url),
               let img = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = img
                }
            }
        }
    }
}

