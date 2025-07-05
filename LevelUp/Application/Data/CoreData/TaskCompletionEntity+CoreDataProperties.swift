//
//  TaskCompletionEntity+CoreDataProperties.swift
//  LevelUp
//
//  Created by Salvador Chavez on 04/07/25.
//
//

import Foundation
import CoreData


extension TaskCompletionEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskCompletionEntity> {
        return NSFetchRequest<TaskCompletionEntity>(entityName: "TaskCompletion")
    }

    @NSManaged public var completedAt: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var taskId: UUID?
    @NSManaged public var task: TaskEntity?

}

extension TaskCompletionEntity : Identifiable {

}
