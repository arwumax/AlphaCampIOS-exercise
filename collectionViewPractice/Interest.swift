//
//  Interest.swift
//  collectionViewPractice
//
//  Created by WuKwok Ho on 6/4/2016.
//  Copyright © 2016 Wu Kwok Ho. All rights reserved.
//

import UIKit

class Interest
{
    var title = ""
    var description = ""
    var numberOfMembers = 0
    var numberOfPosts = 0
    var featuredImage: UIImage!
    
    init(title: String, description: String, featuredImage: UIImage!)
    {
        self.title = title
        self.description = description
        self.featuredImage = featuredImage
        numberOfPosts = 1
        numberOfMembers = 1
    }
    
    static func createInterests() -> [Interest]
    {
        return[
            Interest(title: "AAAAAAAAAA", description: "AAAAAAAAAA", featuredImage: UIImage(named:"p1")!),
            Interest(title: "BBBBBBBBBB", description: "BBBBBBBBBB", featuredImage: UIImage(named:"p2")!),
            Interest(title: "CCCCCCCCCC", description: "CCCCCCCCCC", featuredImage: UIImage(named:"p3")!),
            Interest(title: "DDDDDDDDDD", description: "DDDDDDDDDD", featuredImage: UIImage(named:"p4")!),
        ]
    }
    
}
