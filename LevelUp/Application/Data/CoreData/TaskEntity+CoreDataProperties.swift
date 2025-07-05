//
//  TaskEntity+CoreDataProperties.swift
//  LevelUp
//
//  Created by Salvador Chavez on 04/07/25.
//
//

import Foundation
import CoreData


extension TaskEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskEntity> {
        return NSFetchRequest<TaskEntity>(entityName: "Task")
    }

    @NSManaged public var completedAt: Date?
    @NSManaged public var createdAt: Date?
    @NSManaged public var deadline: Date?
    @NSManaged public var endDate: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var isCompleted: Bool
    @NSManaged public var reminders: String?
    @NSManaged public var startDate: Date?
    @NSManaged public var taskDescription: String?
    @NSManaged public var title: String?
    @NSManaged public var updatedAt: Date?
    @NSManaged public var completions: TaskCompletionEntity?
    @NSManaged public var list: ListEntity?
    @NSManaged public var recurrenceRule: RecurrenceRuleEntity?

}

extension TaskEntity : Identifiable {

}
