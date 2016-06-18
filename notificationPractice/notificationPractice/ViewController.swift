//
//  ViewController.swift
//  notificationPractice
//
//  Created by WuKwok Ho on 1/4/2016.
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
    
    
    @IBAction func doNotification(sender: AnyObject) {
        let localNotification = UILocalNotification()
        let now = NSDate()
        let notiDate = now.dateByAddingTimeInterval(2)
        localNotification.fireDate = notiDate
        localNotification.alertBody = "屌那星～" + String(now)
        localNotification.soundName = UILocalNotificationDefaultSoundName
        localNotification.alertAction = "123"
        localNotification.applicationIconBadgeNumber = 1
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        
        
        
    }


}

