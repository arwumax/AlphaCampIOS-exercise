//
//  ViewController.swift
//  openDataProject1
//
//  Created by WuKwok Ho on 28/3/2016.
//  Copyright © 2016 Wu Kwok Ho. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func downloadData(sender: AnyObject) {
        
        let url: String = "http://data.taipei/opendata/datalist/apiAccess"
        
        Alamofire.request(.GET, url, parameters: ["scope":"resourceAquire",
            "rid": "6f4e0b9b-8cb1-4b1d-a5c4-febd90f62469",
            "limit":"10",
            "offset":"0",])
            .responseJSON {response in
                if let data = response.result.value {
                    let json = JSON(data)
                    print(json)
                
                    let hotelList = json["result"]["results"].arrayValue
                    
                    for hotel in hotelList {
                        print("\(hotel["stitle"].string!)")
                        print("\(hotel["_id"].stringValue)")
                        print()
                    }
                }
        }
    }
}