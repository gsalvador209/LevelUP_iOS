//
//  CoreDataStack.swift
//  LevelUp
//
//  Created by Salvador Chavez on 25/06/25.
//


import CoreData

final class CoreDataStack {
  static let shared = CoreDataStack()
  let container: NSPersistentContainer

    private init(inMmeory: Bool = false) {
      let modelName = "LevelUpDatabase"
    container = NSPersistentContainer(name: modelName)

        if inMmeory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { desc, err in
              if let e = err as NSError? { fatalError("CD load error: \(e)") }
            }
        
  }

  var context: NSManagedObjectContext { container.viewContext }

  func saveContext() {
    let ctx = context
    guard ctx.hasChanges else { return }
    do { try ctx.save() }
    catch { fatalError("CoreData save error: \(error)") }
  }
}
