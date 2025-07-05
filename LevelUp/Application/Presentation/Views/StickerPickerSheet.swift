//
//  StickerPickerSheet.swift
//  LevelUp
//
//  Created by Salvador Chavez on 05/07/25.
//


import UIKit
import CoreData

class StickerPickerSheet: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    private var stickers: [Product] = []
    private var collectionView: UICollectionView!
    var onStickerSelected: ((Product) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        preferredContentSize = CGSize(width: 350, height: 220)

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 70, height: 90)
        layout.sectionInset = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
        layout.scrollDirection = .horizontal

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(StickerCell.self, forCellWithReuseIdentifier: "StickerCell")
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        loadStickers()
    }

    private func loadStickers() {
        // Busca tus OwnedStickerEntity y trae el ProductEntity correspondiente
        let context = CoreDataStack.shared.container.viewContext
        let fetch: NSFetchRequest<OwnedSticker> = OwnedSticker.fetchRequest()
        if let owned = try? context.fetch(fetch) {
            let productIds = owned.compactMap { $0.productId }
            let prodFetch: NSFetchRequest<Product> = Product.fetchRequest()
            prodFetch.predicate = NSPredicate(format: "id IN %@", productIds)
            stickers = (try? context.fetch(prodFetch)) ?? []
            collectionView.reloadData()
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        stickers.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StickerCell", for: indexPath) as! StickerCell
        let sticker = stickers[indexPath.item]
        cell.configure(with: sticker)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sticker = stickers[indexPath.item]
        dismiss(animated: true) {
            self.onStickerSelected?(sticker)
        }
    }
}

class StickerCell: UICollectionViewCell {
    let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }

    required init?(coder: NSCoder) { fatalError() }

    func configure(with sticker: Product) {
        if let imageUrl = sticker.imageUri, let url = URL(string: imageUrl) {
            imageView.loadImage(from: url)
        } else {
            imageView.image = UIImage(systemName: "photo")
        }
    }
}
