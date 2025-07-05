//
//  UserEntity+CoreDataProperties.swift
//  
//
//  Created by Salvador Chavez on 04/07/25.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var avatarUri: String?
    @NSManaged public var goldCoins: Float
    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var registrationDate: String?
    @NSManaged public var silverCoins: Float

}

extension UserEntity : Identifiable {

}
