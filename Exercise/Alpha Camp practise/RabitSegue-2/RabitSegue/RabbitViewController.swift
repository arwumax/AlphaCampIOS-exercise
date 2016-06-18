//
//  RabbitViewController.swift
//  RabitSegue
//
//  Created by Edward Chiang on 3/9/16.
//  Copyright © 2016 Soleil Studio. All rights reserved.
//

import UIKit

// Slide number 27
enum RabbitType {
    case Grass
    case Green
    case Sky
}

class RabbitViewController: UIViewController {
    
    var rabbitType:RabbitType?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Slide 28
        if self.rabbitType != nil {
            // http://stackoverflow.com/questions/31085936/enum-case-is-not-a-member-of-type
            switch rabbitType! {
            case .Grass:
                self.imageView.image = UIImage(named: "RabbitGrass")
            case .Sky:
                self.imageView.image = UIImage(named: "RabbitSky")
            case .Green:
                self.imageView.image = UIImage(named: "RabbitGreen")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismiss(sender: AnyObject) {
        // Slide 22
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
