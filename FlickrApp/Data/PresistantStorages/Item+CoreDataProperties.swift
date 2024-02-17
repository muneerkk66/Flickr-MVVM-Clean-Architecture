//
//  Item+CoreDataProperties.swift
//  FlickrAppTests
//
//  Created by Muneer K K on 17/02/2024.
//
//

import Foundation
import CoreData

extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var searchText: String?
    @NSManaged public var updatedAt: Date?

}

extension Item: Identifiable {

}
