//
//  Person.swift
//  AlphaCampApp
//
//  Created by 建達 陳 on 2016/4/1.
//  Copyright © 2016年 Alpha Camp. All rights reserved.
//

import Foundation

class Person{
    var name:String?
    var image:String?
    var info:String?
    
    init(name:String, image:String, info:String) {
        self.name = name
        self.image = image
        self.info = info
    }
}