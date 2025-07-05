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

        // Configuramos subviews
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        goldLabel.font = .systemFont(ofSize: 14)
        goldLabel.textColor = .white
        goldLabel.translatesAutoresizingMaskIntoConstraints = false

        silverLabel.font = .systemFont(ofSize: 14)
        silverLabel.textColor = .white
        silverLabel.translatesAutoresizingMaskIntoConstraints = false

        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.layer.cornerRadius = 16
        avatarImageView.clipsToBounds = true
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.image = UIImage(named: "default_user")
        avatarImageView.isUserInteractionEnabled = true

        // Añadimos las vistas
        addSubview(titleLabel)
        addSubview(goldLabel)
        addSubview(silverLabel)
        addSubview(avatarImageView)

        // Constraints usando layoutMarginsGuide
        NSLayoutConstraint.activate([
            // El leading y el top se ajustarán según layoutMargins,
            // que actualizaremos en layoutSubviews()
            titleLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.bottomAnchor,constant: -50),

            avatarImageView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            avatarImageView.topAnchor.constraint(equalTo: self.bottomAnchor,constant: -50),
            avatarImageView.widthAnchor.constraint(equalToConstant: 32),
            avatarImageView.heightAnchor.constraint(equalToConstant: 32),

            goldLabel.trailingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: -12),
            goldLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),

            silverLabel.trailingAnchor.constraint(equalTo: goldLabel.leadingAnchor, constant: -8),
            silverLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor)
        ])
    }


    func configure(title: String, gold: Int, silver: Int, avatarURL: String?) {
        titleLabel.text = title
        goldLabel.text   = "🥇 \(gold)"
        silverLabel.text = "🥈 \(silver)"

        if let avatarURL = avatarURL, let url = URL(string: avatarURL) {
            avatarImageView.loadImage(from: url)
        } else {
            avatarImageView.image = UIImage(named: "default_user")
        }
    }
}
