//
//  OwnedSticker+CoreDataProperties.swift
//  
//
//  Created by Salvador Chavez on 04/07/25.
//
//  This file was automatically generated and should not be edited.
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
