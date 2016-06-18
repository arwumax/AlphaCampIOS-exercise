//
//  ClassMain.swift
//  AlphaCampApp
//
//  Created by 建達 陳 on 2016/4/1.
//  Copyright © 2016年 Alpha Camp. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

var course1Name:String = ""
var course2Name:String = ""
var course3Name:String = ""
var courseSelected = 0
var jsonCourse1:JSON?
var jsonCourse2:JSON?
var jsonCourse3:JSON?
let userDefault = NSUserDefaults.standardUserDefaults()
let auth_token = userDefault.objectForKey("auth_token")

let urlforAllCourse = "https://dojo.alphacamp.co/api/v1/courses"
let urlCourse1 = "https://dojo.alphacamp.co/api/v1/courses/core-and-event-8"
let urlCourse2 = "https://dojo.alphacamp.co/api/v1/courses/ios-bootcamp-8"
let urlCourse3 = "https://dojo.alphacamp.co/api/v1/courses/pre-ios-bootcamp"

class ClassMain: UITableViewController {
    

    @IBOutlet var courseTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        guard jsonCourse1 != nil && jsonCourse2 != nil && jsonCourse3 != nil else {
            self.courseTableView.reloadData()
            return
        }
        
        
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
            numberOfRows = jsonCourse1!["syllabus"].count
        case 1:
            numberOfRows = jsonCourse1!["syllabus"].count
        case 2:
            numberOfRows = jsonCourse2!["syllabus"].count
        case 3:
            numberOfRows = jsonCourse3!["syllabus"].count
        default:
            break
        }
    return numberOfRows
    }
    
    @IBAction func chooseCourse(sender: AnyObject) {
        let alert = UIAlertController(title: "選擇想要前往的課程", message: "", preferredStyle: .ActionSheet)
        let course1Action = UIAlertAction(title: course1Name, style: .Default, handler: {
        (UIAlertAction) -> () in
            courseSelected = 1
            self.courseTableView.reloadData()
        })
        let course2Action = UIAlertAction(title: course2Name, style: .Default, handler: {
            (UIAlertAction) -> () in
            courseSelected = 2
            self.courseTableView.reloadData()
        })
        let course3Action = UIAlertAction(title: course3Name, style: .Default, handler: {
            (UIAlertAction) -> () in
            courseSelected = 3
            self.courseTableView.reloadData()
        })
        alert.addAction(course1Action)
        alert.addAction(course2Action)
        alert.addAction(course3Action)
        self.presentViewController(alert, animated: true, completion: nil)
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ClassCell", forIndexPath: indexPath) as! ClassCell
        
        guard jsonCourse1 != nil && jsonCourse2 != nil && jsonCourse3 != nil else {
            return cell
        }
        
        switch courseSelected {
        case 0:
            let str = jsonCourse1!["syllabus"][indexPath.row]["section"]["name"].stringValue
            cell.courseName.text = str
        case 1:
            let str = jsonCourse1!["syllabus"][indexPath.row]["section"]["name"].stringValue
            cell.courseName.text = str
        case 2:
            let str = jsonCourse2!["syllabus"][indexPath.row]["section"]["name"].stringValue
            cell.courseName.text = str
        case 3:
            let str = jsonCourse3!["syllabus"][indexPath.row]["section"]["name"].stringValue
            cell.courseName.text = str
        default:
            break
        }
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toClassDetail" {
            let classDetailViewController = segue.destinationViewController as! ClassSecondLayer
            if let selectedIndexPath = self.courseTableView.indexPathForSelectedRow {
                classDetailViewController.selectedIndexPath = selectedIndexPath
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
