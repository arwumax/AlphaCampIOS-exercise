//
//  ViewController.swift
//  webBrowserPractice
//
//  Created by WuKwok Ho on 1/4/2016.
//  Copyright © 2016 Wu Kwok Ho. All rights reserved.
//

import UIKit
import WebKit
import SafariServices

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func openURL(sender: AnyObject) {
        //唔一定要https,因為佢比左sharedApplication做
        let url = NSURL(string: "http://www.lktmc.edu.hk")
        UIApplication.sharedApplication().openURL(url!)
        
    }
    
    
    
    
    // 幾webView 拉出黎，令其他function 都睇到
    var webView: WKWebView?
    @IBAction func webKitButton(sender: AnyObject) {
        
        //frame 係圖的左上角定座標位置
        //這裡一定要用https
        
        /*let webView = WKWebView(frame: UIScreen.mainScreen().bounds)
        self.view.addSubview(webView) */
        
        // 送在viewOfWeb 的View 入面，完整地
        webView = WKWebView(frame: self.viewOfWeb.bounds)
        self.viewOfWeb.addSubview(webView!)
        
        
        let url = NSURL(string: "https://www.google.com")
        let request = NSURLRequest(URL: url!)
        webView!.loadRequest(request)
        
    
    }

    @IBAction func safariButton(sender: AnyObject) {
        let url = NSURL(string: "https://www.google.com")
        let safariVC = SFSafariViewController(URL: url!)
        self.presentViewController(safariVC, animated: true, completion: nil)
        
    }
    
    @IBAction func backButton(sender: AnyObject) {
        self.webView?.goBack()
        
    }
    @IBOutlet weak var viewOfWeb: UIView!


}


