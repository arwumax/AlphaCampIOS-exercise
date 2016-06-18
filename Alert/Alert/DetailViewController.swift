//
//  DetailViewController.swift
//  Alert
//
//  Created by WANGMING-LIANG on 3/21/16.
//  Copyright © 2016 Fone Shaking. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeDetail(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func doNotify(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("Notif", object: "Smart")
    }

}
