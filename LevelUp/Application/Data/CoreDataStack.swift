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

  private init() {
    container = NSPersistentContainer(name: "LevelUpModel")
    let desc = container.persistentStoreDescriptions.first
    desc?.shouldMigrateStoreAutomatically = true
    desc?.shouldInferMappingModelAutomatically = true
    container.loadPersistentStores { storeDesc, error in
      if let err = error {
        fatalError("CoreData load error: \(err)")
      }
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
