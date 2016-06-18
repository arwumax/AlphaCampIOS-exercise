//
//  Book+CoreDataProperties.swift
//  CoreDataTest
//
//  Created by WANGMING-LIANG on 3/22/16.
//  Copyright © 2016 Fone Shaking. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Book {

    @NSManaged var author: String?
    @NSManaged var isbn: String?
    @NSManaged var name: String?
    @NSManaged var price: NSNumber?

}
