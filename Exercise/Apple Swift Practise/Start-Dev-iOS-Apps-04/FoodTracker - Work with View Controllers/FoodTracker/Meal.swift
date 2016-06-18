//
//  Meal.swift
//  FoodTracker
//
//  Created by WuKwok Ho on 13/3/2016.
//  Copyright © 2016 Apple Inc. All rights reserved.
//

import UIKit

class Meal {
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARL: Initialization
    init?(name: String, photo: UIImage?, rating:Int){
        self.name = name
        self.photo = photo
        self.rating = rating
        
    //Initialization should fail if there is no name or if the rating is negative
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
}
