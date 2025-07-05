//
//  StoreProductCell.swift
//  LevelUp
//
//  Created by Salvador Chavez on 04/07/25.
//


import UIKit

class StoreProductCell: UICollectionViewCell {
    let imageView = UIImageView()
    let nameLabel = UILabel()
    let priceLabel = UILabel()
    let buyButton = UIButton(type: .system)
    var buyButtonAction: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.layer.cornerRadius = 16
        setupUI()
    }
    required init?(coder: NSCoder) { fatalError() }

    private func setupUI() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        buyButton.translatesAutoresizingMaskIntoConstraints = false

        buyButton.setTitle("Comprar", for: .normal)
        buyButton.backgroundColor = UIColor(named: "colorPrimary") ?? .systemBlue
        buyButton.setTitleColor(.white, for: .normal)
        buyButton.layer.cornerRadius = 10

        buyButton.addTarget(self, action: #selector(didTapBuy), for: .touchUpInside)

        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(buyButton)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),

            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),

            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            priceLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            buyButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            buyButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            buyButton.widthAnchor.constraint(equalToConstant: 90),
            buyButton.heightAnchor.constraint(equalToConstant: 32)
        ])
    }

    @objc private func didTapBuy() {
        buyButtonAction?()
    }

    func configure(with product: Product, purchased: Bool) {
        nameLabel.text = product.title
        priceLabel.text = "🥇 \(product.price)"
        buyButton.isEnabled = !purchased
        buyButton.setTitle(purchased ? "Comprado" : "Comprar", for: .normal)
        if let imageUrl = product.imageUri, let url = URL(string: imageUrl) {
            imageView.loadImage(from: url)
        } else {
            imageView.image = UIImage(systemName: "photo")
        }
    }
}
