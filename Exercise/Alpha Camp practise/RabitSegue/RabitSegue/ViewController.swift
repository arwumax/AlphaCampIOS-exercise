//
//  ViewController.swift
//  RabitSegue
//
//  Created by Edward Chiang on 3/9/16.
//  Copyright © 2016 Soleil Studio. All rights reserved.
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

    @IBAction func showSleepRabbit(sender: AnyObject) {
        
        // Match slide number 7
        
        let rabbitView = UIView.init(frame: UIScreen.mainScreen().bounds)
        rabbitView.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(rabbitView)
    }
    
    @IBAction func showRabbitImageViewController(sender: AnyObject) {
        
        // Match slide number 15
        
        let controller : UIViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("RabbitViewController"))!
        controller.modalTransitionStyle = .CrossDissolve
        self.presentViewController(controller, animated: true, completion: nil)
    }

    @IBAction func showByProperty(sender: AnyObject) {
        //Match Slide number 27
        let controller : RabbitViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("RabbitViewController"))! as! RabbitViewController
        controller.rabbitType = RabbitType.Grass
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    @IBAction func showFromSegue(sender: AnyObject) {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showFromSegue" {
            let controller: RabbitViewController = segue.destinationViewController as! RabbitViewController
            controller.rabbitType = RabbitType.Sky
        }
    }
}

