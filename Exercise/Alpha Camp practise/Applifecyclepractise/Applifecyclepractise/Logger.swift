//
//  Logger.swift
//  Applifecyclepractise
//
//  Created by WuKwok Ho on 17/3/2016.
//  Copyright © 2016 Wu Kwok Ho. All rights reserved.
//

import UIKit

class Logger: NSObject {
    static func log(obj: AnyObject!, functionName: String) {
        let now = NSDate()
    print("\(now.description)\(objectGetClass: self, functionName: __FUNCTION__)")
        
    }
}
