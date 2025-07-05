//
//  Date+WeekBounds.swift
//  LevelUp
//
//  Created by Salvador Chavez on 29/06/25.
//

import Foundation

extension Date {
  /// Devuelve inicio (00:00 del lunes) y fin (00:00 del lunes siguiente) de la semana que contiene self.
  func weekBounds() -> (start: Date, end: Date) {
    let cal = Calendar.current
    let comps = cal.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)
    guard let startOfWeek = cal.date(from: comps) else {
      fatalError("No se pudo calcular inicio de semana")
    }
    let endOfWeek = cal.date(byAdding: .day, value: 7, to: startOfWeek)!
    return (start: startOfWeek, end: endOfWeek)
  }
}
