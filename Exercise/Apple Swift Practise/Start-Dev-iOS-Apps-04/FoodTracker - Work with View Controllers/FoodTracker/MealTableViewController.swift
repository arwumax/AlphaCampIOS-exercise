//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by WuKwok Ho on 13/3/2016.
//  Copyright © 2016 Apple Inc. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var meals = [Meal]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the sample data.
        loadSampleMeals()
        
    }
    
        func loadSampleMeals(){
            let photo1 = UIImage(named: "meal1")!
            let meal1 = Meal(name: "Caprese Salad", photo: photo1
            , rating: 4)!
            
            let photo2 = UIImage(named: "meal2")!
            let meal2 = Meal(name: "Chicken", photo: photo2, rating: 5)!
            
            let photo3 = UIImage(named: "meal3")!
            let meal3 = Meal(name: "Pasta with Meatballs", photo: photo3, rating: 3)!
            
            meals += [meal1, meal2, meal3]
            
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        
        let cellIdentifier = "MealTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath:  indexPath) as! MealTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let meal = meals[indexPath.row]
       
        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        cell.ratingControl.rating = meal.rating
        
        return cell
    }

}


