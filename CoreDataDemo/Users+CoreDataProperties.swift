//
//  Users+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Vattanac on 12/5/18.
//  Copyright © 2018 vattanac. All rights reserved.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var age: String?
    @NSManaged public var password: String?
    @NSManaged public var username: String?

}
