//
//  StatsHeatmapView.swift
//  LevelUp
//
//  Created by Salvador Chavez on 05/07/25.
//


import UIKit

class StatsHeatmapView: UIView {
    private var days: [StatsDay] = []

    func configure(days: [StatsDay]) {
        self.days = days
        setNeedsDisplay()
    }

    override func draw(_ rect: CGRect) {
        guard !days.isEmpty else { return }
        let columns = 53   // 53 semanas
        let rows = 7       // 7 días de la semana
        let cellSize: CGFloat = min(bounds.width / CGFloat(columns), bounds.height / CGFloat(rows))
        let spacing: CGFloat = 2

        for week in 0..<columns {
            for day in 0..<rows {
                let idx = week * rows + day
                guard idx < days.count else { continue }
                let dayStat = days[idx]
                let x = CGFloat(week) * (cellSize + spacing)
                let y = CGFloat(day) * (cellSize + spacing)

                let color: UIColor
                switch dayStat.completions {
                case 0: color = UIColor.systemGray5
                case 1: color = UIColor.systemGreen.withAlphaComponent(0.4)
                case 2...4: color = UIColor.systemGreen
                default: color = UIColor.systemGreen.darker()
                }
                color.setFill()
                let rect = CGRect(x: x, y: y, width: cellSize, height: cellSize)
                UIBezierPath(roundedRect: rect, cornerRadius: 3).fill()
            }
        }
    }
}

// Extensión de color para tonos más oscuros
extension UIColor {
    func darker() -> UIColor {
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        guard getHue(&h, saturation: &s, brightness: &b, alpha: &a) else { return self }
        return UIColor(hue: h, saturation: s, brightness: b * 0.6, alpha: a)
    }
}
