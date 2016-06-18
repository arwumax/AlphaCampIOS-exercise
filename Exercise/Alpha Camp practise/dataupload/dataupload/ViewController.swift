//
//  ViewController.swift
//  dataupload
//
//  Created by WuKwok Ho on 28/3/2016.
//  Copyright © 2016 Wu Kwok Ho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func uploadButton(sender: AnyObject) {
        let url = NSURL(string: "https://sheetsu.com/apis/8fce7590")
        let urlRequest = NSMutableURLRequest(URL:url!)
        
        urlRequest.HTTPMethod = "POST"
        
        let postStr = "user=peter&score=99"
        
        let data = postStr.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = NSURLSession.sharedSession().uploadTaskWithRequest(urlRequest, fromData: data) { (returnData:NSData?, res:NSURLResponse?, err:NSError?) -> Void in
            
            
            if let returnData = returnData {
                do {
                    let dic = try NSJSONSerialization.JSONObjectWithData(returnData , options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    let status = dic["success"] as? NSNumber
                    if status!.intValue == 1 {
                        print("success")
                    }
                    
                }
                catch {
                    
                }
            }
        }
    task.resume()
}
