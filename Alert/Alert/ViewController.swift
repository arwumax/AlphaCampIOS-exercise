//
//  ViewController.swift
//  Alert
//
//  Created by WANGMING-LIANG on 3/21/16.
//  Copyright © 2016 Fone Shaking. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelMessage: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateLabel:", name: "Notif", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateLabel(notification: NSNotification) {
        let data = notification.object as! String
        
        self.labelMessage.text = "Got message from \(data)"
    }


    @IBAction func doAlert(sender: AnyObject) {
        let alert = UIAlertController(title: "警告", message: "警告訊息", preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(cancelAction)
        
//        alert.view.tintColor = UIColor.grayColor()
        
        let okAction = UIAlertAction(title: "Ok", style: .Default) { (UIAlertAction) -> Void in
            self.performSegueWithIdentifier("show detail", sender: "")
        }
        alert.addAction(okAction)
        
        let ok1Action = UIAlertAction(title: "Ok1", style: .Destructive, handler: {
            (action: UIAlertAction) -> Void in
            self.performSegueWithIdentifier("show detail", sender: "")
        })
        alert.addAction(ok1Action)
        
        presentViewController(alert, animated: true, completion: nil)
    }
}

