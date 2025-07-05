import Foundation
import Combine
import CoreData
import UIKit

class ProfileViewModel: ObservableObject {

    static let shared = ProfileViewModel()
    
    @Published var name: String = ""
    @Published var avatarUri: String?
    @Published var goldCoins: Int = 0
    @Published var silverCoins: Int = 0

    private var context: NSManagedObjectContext
    private var user: UserEntity?
    private let USER_ID = "singleton_user"

    init(context: NSManagedObjectContext = CoreDataStack.shared.container.viewContext) {
        self.context = context
        loadUser()
    }

    private func loadUser() {
        let request: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", USER_ID)
        request.fetchLimit = 1

        do {
            if let existingUser = try context.fetch(request).first {
                self.user = existingUser
            } else {
                let newUser = UserEntity(context: context)
                newUser.id = USER_ID
                newUser.name = "User"
                newUser.goldCoins = 0
                newUser.silverCoins = 0
                try context.save()
                self.user = newUser
            }

            // Actualizar variables publicadas
            if let user = self.user {
                name = user.name ?? ""
                avatarUri = user.avatarUri
                goldCoins = Int(user.goldCoins)
                silverCoins = Int(user.silverCoins)
            }

        } catch {
            print("❌ Error loading user: \(error)")
        }
    }

    func saveName(_ newName: String) {
        guard let user = user else { return }
        user.name = newName
        try? context.save()
        name = newName
    }

    func saveAvatar(uri: String) {
        guard let user = user else { return }
        user.avatarUri = uri
        try? context.save()
        avatarUri = uri
    }

    func addSilverCoin() {
        guard let user = user else { return }
        var silver = Int(user.silverCoins) + 1
        var gold = Int(user.goldCoins)

        if silver >= 10 {
            silver -= 10
            gold += 1
        }

        user.silverCoins = Float(silver)
        user.goldCoins = Float(gold)

        try? context.save()

        self.silverCoins = silver
        self.goldCoins = gold
    }
}
