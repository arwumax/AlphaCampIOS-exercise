//
//  NameViewController.swift
//  RabitSegue
//
//  Created by Edward Chiang on 3/10/16.
//  Copyright © 2016 Soleil Studio. All rights reserved.
//

import UIKit



protocol RabbitNameEditViewControllerDelegate {
    func modifyName(editName: String?)
}

class NameViewController: UIViewController {
    
    var rabbitName:String?
    
    var delegate:RabbitNameEditViewControllerDelegate?

    @IBOutlet weak var rabitNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if rabbitName != nil {
            self.rabitNameTextField.text = rabbitName
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelDidPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveDidPressed(sender: AnyObject) {
        
        // Slide 39
        
        let calledViewController :ViewController = self.presentingViewController as! ViewController
        
        calledViewController.rabbitNameLabel.text = self.rabitNameTextField.text
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func notificationSaved(sender: AnyObject) {
        
        if self.rabitNameTextField.text != nil {
            NSNotificationCenter.defaultCenter().postNotificationName("UpdateUINotify", object: nil, userInfo: ["rabbitName":self.rabitNameTextField.text!])
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func delegateSaved(sender: AnyObject) {
        
        self.delegate?.modifyName(self.rabitNameTextField.text)
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
