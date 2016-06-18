//
//  ViewController.swift
//  AlertButton
//
//  Created by WuKwok Ho on 21/3/2016.
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

    @IBAction func alertaction(sender: AnyObject) {
        let alert = UIAlertController(title: "Alert", message: "Don't touch me anymore", preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(cancelAction)
        
        
        let okAction = UIAlertAction(title: "OK", style: .Default) { (UIAlertAction) -> Void in
            self.performSegueWithIdentifier("show detail", sender: "")
        }
        alert.addAction(okAction)
        
        
        
        
        
        presentViewController(alert, animated: true, completion: nil)
        
    }

}

