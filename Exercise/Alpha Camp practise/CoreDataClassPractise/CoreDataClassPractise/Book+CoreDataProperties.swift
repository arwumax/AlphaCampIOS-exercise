//
//  Book+CoreDataProperties.swift
//  CoreDataClassPractise
//
//  Created by WuKwok Ho on 23/3/2016.
//  Copyright © 2016 Wu Kwok Ho. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Book {

    @NSManaged var isbn: String?
    @NSManaged var name: String?
    @NSManaged var author: String?
    @NSManaged var price: NSNumber?
    @NSManaged var address: String?

}
