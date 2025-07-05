//
//  TopBarView.swift
//  LevelUp
//
//  Created by Salvador Chavez on 04/07/25.
//


import UIKit

final class TopBarView: UIView {

    let titleLabel = UILabel()
    let goldLabel = UILabel()
    let silverLabel = UILabel()
    let avatarImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        backgroundColor = UIColor(named: "colorPrimary") ?? .systemBrown

        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        goldLabel.font = .systemFont(ofSize: 14)
        silverLabel.font = .systemFont(ofSize: 14)
        goldLabel.textColor = .white
        silverLabel.textColor = .white
        goldLabel.translatesAutoresizingMaskIntoConstraints = false
        silverLabel.translatesAutoresizingMaskIntoConstraints = false

        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.layer.cornerRadius = 16
        avatarImageView.clipsToBounds = true
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.image = UIImage(named: "default_user")
        avatarImageView.isUserInteractionEnabled = true

        addSubview(titleLabel)
        addSubview(goldLabel)
        addSubview(silverLabel)
        addSubview(avatarImageView)

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 32),
            avatarImageView.heightAnchor.constraint(equalToConstant: 32),

            goldLabel.trailingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: -12),
            goldLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            silverLabel.trailingAnchor.constraint(equalTo: goldLabel.leadingAnchor, constant: -8),
            silverLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    func configure(title: String, gold: Int, silver: Int, avatarURL: String?) {
        titleLabel.text = title
        goldLabel.text = "🥇 \(gold)"
        silverLabel.text = "🥈 \(silver)"
        if let urlString = avatarURL, let url = URL(string: urlString) {
            avatarImageView.loadImage(from: url)
        } else {
            avatarImageView.image = UIImage(named: "default_user")
        }
    }
}
