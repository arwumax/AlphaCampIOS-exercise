//
//  ClassSeondLayer.swift
//  AlphaCampApp
//
//  Created by 建達 陳 on 2016/4/1.
//  Copyright © 2016年 Alpha Camp. All rights reserved.
//

import UIKit

class ClassSecondLayer: UITableViewController {
    
    @IBOutlet var classSecondLayerTableView: UITableView!
    var selectedIndexPath = NSIndexPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        var numberOfRows = 0
        
        guard jsonCourse1 != nil && jsonCourse2 != nil && jsonCourse3 != nil else {
            return 0
        }
        
        switch courseSelected {
        case 0:
            numberOfRows = jsonCourse1!["syllabus"][selectedIndexPath.row]["lessons"].count
        case 1:
            numberOfRows = jsonCourse1!["syllabus"][selectedIndexPath.row]["lessons"].count
        case 2:
            numberOfRows = jsonCourse2!["syllabus"][selectedIndexPath.row]["lessons"].count
        case 3:
            numberOfRows = jsonCourse3!["syllabus"][selectedIndexPath.row]["lessons"].count
        default:
            break
        }
        return numberOfRows
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("classSecondLayerCell", forIndexPath: indexPath) as! ClassSecondLayerCellTableViewCell

        guard jsonCourse1 != nil && jsonCourse2 != nil && jsonCourse3 != nil else {
            return cell
        }
        
        switch courseSelected {
        case 0:
            let str = jsonCourse1!["syllabus"][selectedIndexPath.row]["lessons"][indexPath.row]["name"].stringValue
            cell.secondLayerCell.text = str
        case 1:
            let str = jsonCourse1!["syllabus"][selectedIndexPath.row]["lessons"][indexPath.row]["name"].stringValue
            cell.secondLayerCell.text = str
        case 2:
            let str = jsonCourse2!["syllabus"][selectedIndexPath.row]["lessons"][indexPath.row]["name"].stringValue
            cell.secondLayerCell.text = str
        case 3:
            let str = jsonCourse3!["syllabus"][selectedIndexPath.row]["lessons"][indexPath.row]["name"].stringValue
            cell.secondLayerCell.text = str
        default:
            break
        }
        
        return cell

        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toCellWeb" {
            let webViewController = segue.destinationViewController as! ClassDetail
            if let indexPath = self.classSecondLayerTableView.indexPathForSelectedRow {
                switch courseSelected {
                case 0:
                    let url = jsonCourse1!["syllabus"][selectedIndexPath.row]["lessons"][indexPath.row]["url"].stringValue
                    webViewController.url = url
                case 1:
                    let url = jsonCourse1!["syllabus"][selectedIndexPath.row]["lessons"][indexPath.row]["url"].stringValue
                    webViewController.url = url
                case 2:
                    let url = jsonCourse2!["syllabus"][selectedIndexPath.row]["lessons"][indexPath.row]["url"].stringValue
                    webViewController.url = url
                case 3:
                    let url = jsonCourse3!["syllabus"][selectedIndexPath.row]["lessons"][indexPath.row]["url"].stringValue
                    webViewController.url = url
                default:
                    break
                }
            }
        }
        
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
