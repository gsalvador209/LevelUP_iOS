//
//  ListEntity+CoreDataProperties.swift
//  LevelUp
//
//  Created by Salvador Chavez on 04/07/25.
//
//

import Foundation
import CoreData


extension ListEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ListEntity> {
        return NSFetchRequest<ListEntity>(entityName: "List")
    }

    @NSManaged public var colorId: Int16
    @NSManaged public var createdAt: Date?
    @NSManaged public var customName: String?
    @NSManaged public var id: UUID?
    @NSManaged public var systemName: String?
    @NSManaged public var type: String?
    @NSManaged public var tasks: NSSet?

}

// MARK: Generated accessors for tasks
extension ListEntity {

    @objc(addTasksObject:)
    @NSManaged public func addToTasks(_ value: TaskEntity)

    @objc(removeTasksObject:)
    @NSManaged public func removeFromTasks(_ value: TaskEntity)

    @objc(addTasks:)
    @NSManaged public func addToTasks(_ values: NSSet)

    @objc(removeTasks:)
    @NSManaged public func removeFromTasks(_ values: NSSet)

}

extension ListEntity : Identifiable {

}
