//
//  Space+CoreDataProperties.swift
//  
//
//  Created by Salvador Chavez on 04/07/25.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Space {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Space> {
        return NSFetchRequest<Space>(entityName: "Space")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var thumbnailUrl: String?

}

extension Space : Identifiable {

}
