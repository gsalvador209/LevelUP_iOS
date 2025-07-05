//
//  StatsListCell.swift
//  LevelUp
//
//  Created by Salvador Chavez on 05/07/25.
//


import UIKit

class StatsListCell: UITableViewCell {
    private let titleLabel = UILabel()
    private let heatmapView = StatsHeatmapView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(heatmapView)
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        heatmapView.translatesAutoresizingMaskIntoConstraints = false

        let spacing: CGFloat = 2
        let columns = 26
        // ancho real del heatmap (contentView.width − márgenes 16+16)
        let availableWidth = UIScreen.main.bounds.width - 32
        let totalSpacing = spacing * CGFloat(columns - 1)
        let cellSize = (availableWidth - totalSpacing) / CGFloat(columns)
        let heatmapHeight = cellSize * 7 + spacing * CGFloat(7 - 1)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            heatmapView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            heatmapView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            heatmapView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            heatmapView.heightAnchor.constraint(equalToConstant: heatmapHeight),
            heatmapView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }

    required init?(coder: NSCoder) { fatalError() }

    func configure(with stats: StatsList) {
        titleLabel.text = stats.list.customName ?? stats.list.type ?? "Lista"
        heatmapView.configure(days: stats.days)
    }
}
