//
//  FirstViewController.swift
//  AlphaCampApp
//
//  Created by 建達 陳 on 2016/4/1.
//  Copyright © 2016年 Alpha Camp. All rights reserved.
//

import UIKit
import WebKit

class EventMainView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = "https://www.alphacamp.co/events/"
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


}

