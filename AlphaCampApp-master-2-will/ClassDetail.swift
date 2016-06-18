//
//  ClassDetail.swift
//  AlphaCampApp
//
//  Created by 建達 陳 on 2016/4/1.
//  Copyright © 2016年 Alpha Camp. All rights reserved.
//

import UIKit
import WebKit
import Alamofire
import SwiftyJSON

class ClassDetail: UIViewController {
    
    var url = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        let webView = WKWebView(frame:UIScreen.mainScreen().bounds)
        self.view.addSubview(webView)
        
        let nsUrl = NSURL(string: url)
        let request = NSURLRequest(URL: nsUrl!)
        webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
