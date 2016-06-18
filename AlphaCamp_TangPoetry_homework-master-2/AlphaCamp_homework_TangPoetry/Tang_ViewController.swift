//
//  TangViewController.swift
//  AlphaCamp_homework_TangPoetry
//
//  Created by Ka Ho on 18/3/2016.
//  Copyright © 2016 Ka Ho. All rights reserved.
//

import UIKit

let tang_url = NSURL(string: "https://kahopoon.net/poetry.php?show=poet&category=T")

class Tang_ViewController: UITableViewController {
    
    let data = NSData(contentsOfURL: tang_url!)
    var rawData = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.title = self.title
        
        do {
            let object = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            if let dictionary = object as? [String: AnyObject] {
                readJSONObject(dictionary)
            }
        } catch {
            // Handle Error
        }
    }
    
    func readJSONObject(object: [String: AnyObject]) {
        guard let results = object["results"] as? [[String: AnyObject]] else { return }
        
        for result in results {
            guard let id = result["id"] as? Int, let name = result["name"] as? String else { break }
            rawData.append(["id":String(id), "name":name])
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        navigationController?.topViewController?.title = self.title
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showTangList" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let currentData : Dictionary = self.rawData[indexPath.row]
                let id = currentData["id"]
                let name = currentData["name"]
                
                let controller = segue.destinationViewController as! PoemList_ViewController
                controller.poet_id = id!
                controller.poet_name = name!
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.rawData.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Tang_Cell", forIndexPath: indexPath)

        // Configure the cell...
        let cellData : Tang_Cell = cell as! Tang_Cell
        let currentData : Dictionary = self.rawData[indexPath.row]
        
        cellData.name.text = currentData["name"]

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
