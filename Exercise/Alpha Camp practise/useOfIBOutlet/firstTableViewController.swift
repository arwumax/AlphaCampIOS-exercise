//
//  firstTableViewController.swift
//  useOfIBOutlet
//
//  Created by WuKwok Ho on 21/3/2016.
//  Copyright © 2016 Wu Kwok Ho. All rights reserved.
//

import UIKit

class firstTableViewController: UITableViewController {
    
    var booksData = [
        ["name":"Criminalistics: An Introduction to Forensic Science, Global Edition, 11/e (Paperback)",
            
        "image" : "onepunch",

        "contentDescription" : "Brand New, International Ed/Global Ed, Mainly Same content at bargain price"
        ],
        
        ["name":"Introduction to Algorithms, 3/e (IE-Paperback)",
            
        "image" : "onepunch1",
            
        "contentDescription" : "NOTE: This International Student Edition is not available in the USA or Canada. Some books on algorithms are rigorous but incomplete; others cover masses of ..."
        ],
        
        ["name":"The C Programming Language, 2/e (IE-Paprback)",
            
        "image" : "demo",

        "contentDescription" : "<內容簡介> This second editon describes C as defined by the ANSIstandard. This book is meant to help the reader learnhow to program in C. The book assumes..."
        ]
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 165
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.booksData.count
    }


 override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("firstTableViewCell", forIndexPath: indexPath)

        // Configure the cell...
    let bookCell : firstTableViewCell = cell as! firstTableViewCell
    let currentData : Dictionary = self.booksData[indexPath.row]
    print("currentData:\(currentData)")
    
    bookCell.bookTitle.text = currentData["name"]
    bookCell.bookdescription.text = currentData["contentDescription"]
    if currentData["image"] != nil {
        bookCell.bookImage.image = UIImage(named: currentData["image"]!)
    }
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
