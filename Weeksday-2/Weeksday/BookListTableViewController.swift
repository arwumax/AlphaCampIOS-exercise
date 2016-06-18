//
//  BookListTableViewController.swift
//  Weeksday
//
//  Created by Edward Chiang on 3/14/16.
//  Copyright © 2016 Soleil Studio. All rights reserved.
//

import UIKit

class BookListTableViewController: UITableViewController {
    
    var booksData = [
        ["name":"Criminalistics: An Introduction to Forensic Science, Global Edition, 11/e (Paperback)",
            
        "description":"英文，Richard Saferstein，Prentice Hall 出版日期：2014-02-23",
        "originalPrice":"$1980",
            // Criminalistics
            "image" : "Criminalistics",
            "deleverStatus" : "立即出貨",
            "specialPrice" :"貴賓價: $1881",
            "contentDescription" : "Brand New, International Ed/Global Ed, Mainly Same content at bargain price"
        ],
        ["name":"Introduction to Algorithms, 3/e (IE-Paperback)",
            "description":"英文，Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest，MIT 出版日期：2009-09-29",
            "image" : "Algor",
            "originalPrice":"$1590",
            "deleverStatus" : "立即出貨",
            "specialPrice" :"貴賓價: $1558",
            "contentDescription" : "NOTE: This International Student Edition is not available in the USA or Canada. Some books on algorithms are rigorous but incomplete; others cover masses of ..."
        ],
        ["name":"The C Programming Language, 2/e (IE-Paprback)",
            "description":"英文，Brian W. Kernighan , Dennis M. Ritchie，Prentice Hall 出版日期：1999-07-31",
            "image" : "CBook",
            "originalPrice":"$640",
            "deleverStatus" : "立即出貨",
            "specialPrice" :"貴賓價: $608 ",
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
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.booksData.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BookStatusViewCell", forIndexPath: indexPath)

        // Configure the cell...
        let bookCell : BookStatusViewCell = cell as! BookStatusViewCell
        let currentData : Dictionary = self.booksData[indexPath.row]
        print("CurrentData:\(currentData)")
        
        bookCell.bookNameLabel.text = currentData["name"]
        bookCell.bookDescriptionLabel.text = currentData["description"]
        bookCell.originalPriceLabel.text = currentData["originalPrice"]
        bookCell.specialPriceLabel.text = currentData["specialPrice"]
        bookCell.deliverStatusLabel.text = currentData["deleverStatus"]
        bookCell.contentDescriptionLabel.text = currentData["contentDescription"]
        if currentData["image"] != nil {
            bookCell.coverImageView.image = UIImage(named: currentData["image"]!)
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
