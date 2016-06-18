//
//  buttonViewController.swift
//  AlertPractise
//
//  Created by WuKwok Ho on 22/3/2016.
//  Copyright © 2016 Wu Kwok Ho. All rights reserved.
//

import UIKit

class buttonViewController: UIViewController {


    @IBOutlet weak var aButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.aButton.setTitle("One More question!", forState: .Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func aButton(sender: AnyObject) {
        let alert = UIAlertController(title: "再問你一個問題？", message: "願意跟誰談戀愛", preferredStyle: .ActionSheet)
        
        let maxAction = UIAlertAction(title: "Max", style: .Default, handler: nil)
        alert.addAction(maxAction)
        
        
        let maryAction = UIAlertAction(title: "Mary", style: .Default, handler: nil)
        alert.addAction(maryAction)
        
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }




}
