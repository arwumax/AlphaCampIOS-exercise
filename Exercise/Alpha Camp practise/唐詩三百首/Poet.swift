//
//  Poet.swift
//  唐詩三百首
//
//  Created by WuKwok Ho on 14/3/2016.
//  Copyright © 2016 Wu Kwok Ho. All rights reserved.
//

import UIKit

class Poet {
    
    var name: String
    var photo: UIImage
    var dynasty: String
    var year: String
    
    init?(name:String, photo:UIImage, dynasty: String, year: String){
        self.name = name
        self.photo = photo
        self.dynasty = dynasty
        self.year = year
        
    }
}
