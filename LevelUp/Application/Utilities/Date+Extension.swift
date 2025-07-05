//
//  Date+Extension.swift
//  LevelUp
//
//  Created by Salvador Chavez on 05/07/25.
//

import Foundation

extension Date {
    /// Devuelve la fecha con formato "yyyy-MM-dd"
    func toDayString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }

    /// Conveniencia estática si la prefieres así
    static func dayString(from date: Date) -> String {
        return date.toDayString()
    }
}
