//
//  SecondViewController.swift
//  Applifecyclepractise
//
//  Created by WuKwok Ho on 17/3/2016.
//  Copyright © 2016 Wu Kwok Ho. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func awakeFromNib() {
        print("\(object_getClass(self)) - \(__FUNCTION__)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("\(object_getClass(self)) - \(__FUNCTION__)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print("\(object_getClass(self)) - \(__FUNCTION__)")
    }
    
    override func viewDidLayoutSubviews() {
        print("\(object_getClass(self)) - \(__FUNCTION__)")
    }
    
    override func viewWillAppear(animated: Bool) {
        print("\(object_getClass(self)) - \(__FUNCTION__)")
    }
    
    override func viewDidAppear(animated: Bool) {
        print("\(object_getClass(self)) - \(__FUNCTION__)")
    }
    
    override func viewWillDisappear(animated: Bool) {
        print("\(object_getClass(self)) - \(__FUNCTION__)")
    }
    
    override func viewDidDisappear(animated: Bool) {
        print("\(object_getClass(self)) - \(__FUNCTION__)")
    }

}

