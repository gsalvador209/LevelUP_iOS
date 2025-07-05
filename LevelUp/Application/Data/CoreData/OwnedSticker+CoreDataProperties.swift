//
//  OwnedSticker+CoreDataProperties.swift
//  LevelUp
//
//  Created by Salvador Chavez on 04/07/25.
//
//

import Foundation
import CoreData


extension OwnedSticker {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OwnedSticker> {
        return NSFetchRequest<OwnedSticker>(entityName: "OwnedSticker")
    }

    @NSManaged public var productId: String?
    @NSManaged public var purchasedAt: Date?
    @NSManaged public var userId: String?

}

extension OwnedSticker : Identifiable {

}
