//
//  Product+CoreDataProperties.swift
//  
//
//  Created by Salvador Chavez on 04/07/25.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var category: String?
    @NSManaged public var id: String?
    @NSManaged public var imageUri: String?
    @NSManaged public var price: Double
    @NSManaged public var title: String?

}

extension Product : Identifiable {

}
