//
//  ListRepository.swift
//  LevelUp
//
//  Created by Salvador Chavez on 25/06/25.
//


// LevelUp/Data/Repositories/ListRepository.swift

import CoreData

final class ListRepository {
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext = CoreDataStack.shared.context) {
        self.context = context
    }

    // MARK: – Read

    /// Recupera una lista por su systemName (clave única)
    func fetchList(bySystemName systemName: String) throws -> ListEntity? {
        let req: NSFetchRequest<ListEntity> = ListEntity.fetchRequest()
        req.predicate = NSPredicate(format: "systemName == %@", systemName)
        req.fetchLimit = 1
        return try context.fetch(req).first
    }

    // MARK: – Seed Defaults

    /// Inserta sólo si no existe la lista con ese systemName
    func seedDefaultLists() {
        let defaults: [(systemName: String, displayName: String, colorId: Int16)] = [
            ("inbox",      "Inbox",      0),
            ("objectives", "Objectives", 1)
        ]

        for (systemName, displayName, colorId) in defaults {
            do {
                if try fetchList(bySystemName: systemName) == nil {
                    let list = ListEntity(context: context)
                    list.id         = UUID()               // :contentReference[oaicite:0]{index=0}
                    list.systemName = systemName            // clave interna
                    list.type       = displayName           // nombre por defecto
                    list.customName = nil                   // sin nombre custom aún
                    list.colorId    = colorId               // asigna un color por defecto
                    let now = Date()
                    list.createdAt  = now

                    try context.save()
                }
            } catch {
                print("⚠️ Error al sembrar lista \(displayName): \(error)")
            }
        }
    }
}
