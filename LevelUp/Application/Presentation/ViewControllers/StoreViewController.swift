import UIKit
import CoreData

class StoreViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private var products: [Product] = []
    private var purchasedProductIds: Set<String> = []
    private let profileVM = ProfileViewModel.shared

    private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Tienda"
        
        setupCollectionView()
        fetchProductsFromAPI()
        fetchPurchasedProducts()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 160, height: 220)
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(StoreProductCell.self, forCellWithReuseIdentifier: "StoreProductCell")
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(collectionView)
    }
    
    // MARK: - API fetch
    private func fetchProductsFromAPI() {
        // 🔥 Usa tu endpoint real aquí:
        guard let url = URL(string: "https://private-bb8f6f-stickers5.apiary-mock.com/stickers/all_stickers") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  let products = try? JSONDecoder().decode([ProductDTO].self, from: data) else {
                print("Error descargando productos")
                return
            }
            DispatchQueue.main.async {
                self.saveProductsToCoreData(products: products)
                self.reloadProducts()
            }
        }
        task.resume()
    }
    
    private func saveProductsToCoreData(products: [ProductDTO]) {
        let context = CoreDataStack.shared.container.viewContext
        for productDTO in products {
            let fetch: NSFetchRequest<Product> = Product.fetchRequest()
            fetch.predicate = NSPredicate(format: "id == %@", productDTO.id)
            if let found = try? context.fetch(fetch), found.isEmpty == false {
                continue // Ya existe
            }
            let entity = Product(context: context)
            entity.id = productDTO.id
            entity.title = productDTO.title
            entity.price = Double(productDTO.price)
            entity.imageUri = productDTO.imageUrl
        }
        try? context.save()
    }

    private func reloadProducts() {
        let context = CoreDataStack.shared.container.viewContext
        let req: NSFetchRequest<Product> = Product.fetchRequest()
        products = (try? context.fetch(req)) ?? []
        collectionView.reloadData()
    }
    
    private func fetchPurchasedProducts() {
        let context = CoreDataStack.shared.container.viewContext
        let req: NSFetchRequest<OwnedSticker> = OwnedSticker.fetchRequest()
        if let owned = try? context.fetch(req) {
            purchasedProductIds = Set(owned.compactMap { $0.productId })
        }
        collectionView?.reloadData()
    }

    // MARK: - CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreProductCell", for: indexPath) as! StoreProductCell
        let product = products[indexPath.item]
        let isPurchased = purchasedProductIds.contains(product.id ?? "")
        cell.configure(with: product, purchased: isPurchased)
        cell.buyButtonAction = { [weak self] in
            self?.buyProduct(product)
        }
        return cell
    }

    // MARK: - Comprar producto
    private func buyProduct(_ product: Product) {
        guard let id = product.id else { return }
        if profileVM.goldCoins < Int(product.price) {
            showAlert("No tienes monedas suficientes")
            return
        }
        // Descuenta monedas
        profileVM.goldCoins -= Int(product.price)
        // Guarda como comprado en CoreData
        let context = CoreDataStack.shared.container.viewContext
        let owned = OwnedSticker(context: context)
        owned.productId = id
        try? context.save()
        // Refresca la lista
        fetchPurchasedProducts()
        reloadProducts()
        //showAlert("¡Comprado!")
    }
    
    private func showAlert(_ msg: String) {
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

// MARK: - Models auxiliares solo para el fetch
struct ProductDTO: Decodable {
    let id: String
    let title : String
    let category : String
    let price: Float
    let imageUrl: String?
}
