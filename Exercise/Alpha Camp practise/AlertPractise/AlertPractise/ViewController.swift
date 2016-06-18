//
//  ViewController.swift
//  AlertPractise
//
//  Created by WuKwok Ho on 21/3/2016.
//  Copyright © 2016 Wu Kwok Ho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var aButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.aButton.setTitle("Press Me!", forState: .Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func aButton(sender: AnyObject) {
        let alert = UIAlertController(title: "問你一個問題？", message: "想不想談戀愛", preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(cancelAction)
        
    
        let okAction = UIAlertAction(title: "Yes", style: .Default) { (UIAlertAction) -> Void in
//            self.performSegueWithIdentifier("show detail", sender: "")
            
            self.showSecondQuestion()
        }
        alert.addAction(okAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
 
    }
    
    func showSecondQuestion() {
    
        let alert = UIAlertController(title: "再問你一個問題？", message: "願意跟誰談戀愛", preferredStyle: .ActionSheet)
        
        let maxAction = UIAlertAction(title: "Max", style: .Default, handler: nil)
        alert.addAction(maxAction)
        
        
        let maryAction = UIAlertAction(title: "Mary", style: .Default, handler: nil)
        alert.addAction(maryAction)
        
        
        self.presentViewController(alert, animated: true, completion: nil)
    
    }
    
    
//顯示alert，詢問想不想談戀愛. 回答yes了話，再以action sheet詢問願意跟誰談戀愛，選項自填。
}

