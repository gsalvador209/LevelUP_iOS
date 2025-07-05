//
//  StickerState.swift
//  LevelUp
//
//  Created by Salvador Chavez on 05/07/25.
//

import Foundation

struct StickerState: Codable {
    let stickerId: String
    let centerX: CGFloat
    let centerY: CGFloat
    let scale: CGFloat
    let rotation: CGFloat
    let imageUrl: String
}
