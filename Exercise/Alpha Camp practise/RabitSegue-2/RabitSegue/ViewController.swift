//
//  ViewController.swift
//  RabitSegue
//
//  Created by Edward Chiang on 3/9/16.
//  Copyright © 2016 Soleil Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, RabbitNameEditViewControllerDelegate {

    // Slide 39
    @IBOutlet weak var rabbitNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateUI:", name: "UpdateUINotify", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI(notifiction:NSNotification) {
        print("Notifcation:\(notifiction.userInfo!["rabbitName"] as! String)")
        // Match slide number 43
        self.rabbitNameLabel.text = notifiction.userInfo!["rabbitName"] as? String
    }

    @IBAction func showSleepRabbit(sender: AnyObject) {
        
        // Match slide number 7
        
        let rabbitView = UIView.init(frame: UIScreen.mainScreen().bounds)
        rabbitView.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(rabbitView)
    }
    
    @IBAction func showRabbitImageViewController(sender: AnyObject) {
        
        // Match slide number 15
        
        let controller : UIViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("RabbitViewController"))!
        controller.modalTransitionStyle = .FlipHorizontal
        self.presentViewController(controller, animated: true, completion: nil)
    }

    @IBAction func showByProperty(sender: AnyObject) {
        // Match slide number 27
        let controller : RabbitViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("RabbitViewController"))! as! RabbitViewController
        controller.rabbitType = RabbitType.Grass
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    @IBAction func showFromSegue(sender: AnyObject) {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Match slide number 30
        if segue.identifier == "showFromSegue" {
            let controller: RabbitViewController = segue.destinationViewController as! RabbitViewController
            controller.rabbitType = RabbitType.Sky
        }
        // Prepare for slide number 38, 39
        if segue.identifier == "EditRabitName" {
            let controller: NameViewController = segue.destinationViewController as! NameViewController
            controller.delegate = self
            controller.rabbitName = self.rabbitNameLabel.text
        }
    }
    
    // MARK: - RabbitNameEditViewControllerDelegate
    
    func modifyName(editName: String?) {
        // Match slide number 48
        self.rabbitNameLabel.text = editName
    }
}

