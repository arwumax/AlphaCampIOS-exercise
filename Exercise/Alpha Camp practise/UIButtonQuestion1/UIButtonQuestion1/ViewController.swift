//
//  ViewController.swift
//  UIButtonQuestion1
//
//  Created by WuKwok Ho on 18/3/2016.
//  Copyright © 2016 Wu Kwok Ho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewButton: UIButton!
    @IBOutlet weak var nextPageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.viewButton.setTitle("明月幾時有", forState: . Normal)
        self.viewButton.setTitle("把酒問青天", forState: . Highlighted)
        self.nextPageButton.setTitle("next page", forState: .Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

