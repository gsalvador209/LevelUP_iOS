//
//  RecurrenceRuleEntity+CoreDataProperties.swift
//  LevelUp
//
//  Created by Salvador Chavez on 23/06/25.
//
//

import Foundation
import CoreData


extension RecurrenceRuleEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecurrenceRuleEntity> {
        return NSFetchRequest<RecurrenceRuleEntity>(entityName: "RecurrenceRule")
    }

    @NSManaged public var taskId: UUID?
    @NSManaged public var rrule: String?
    @NSManaged public var ststartUtc: Date?
    @NSManaged public var task: TaskEntity?

}

extension RecurrenceRuleEntity : Identifiable {

}
