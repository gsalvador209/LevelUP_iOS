//
//  UIColor+Palette.swift
//  LevelUp
//
//  Created by Salvador Chavez on 24/06/25.
//

import UIKit

extension UIColor {
    static func listBackgroundColor(for id: Int16) -> UIColor {
        switch id {
        case 0: return .systemRed.withAlphaComponent(0.2)
        case 1: return .systemBlue.withAlphaComponent(0.2)
        case 2: return .systemGreen.withAlphaComponent(0.2)
        default: return .tertiarySystemBackground
        }
    }

    static func listTextColor(for id: Int16) -> UIColor {
        switch id {
        case 0: return .systemRed
        case 1: return .systemBlue
        case 2: return .systemGreen
        default: return .label
        }
    }
}
