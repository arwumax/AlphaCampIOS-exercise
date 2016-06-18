//
//  ViewController.swift
//  networkfoundation
//
//  Created by WuKwok Ho on 25/3/2016.
//  Copyright © 2016 Wu Kwok Ho. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var imageUrl: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func downloadButton(sender: AnyObject) {
        
        let urlStr = "http://res.cloudinary.com/hrscywv4p/image/upload/c_limit,f_auto,h_3000,q_80,w_1200/v1/271374/http_s3.amazonaws.com_feather-files-aviary-prod-us-east-1_f5da8ea5e_2015-03-12_723490bbf79e44a788f5cd2516fefd46_myvzle.jpg"
        
        let url = NSURL(string: urlStr)
        // let data = NSData(contentsOfURL: url!)
        
        let urlRequest = NSURLRequest(URL: url!, cachePolicy: .ReturnCacheDataElseLoad, timeoutInterval: 3)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(urlRequest) {
            
            (data:NSData?, response: NSURLResponse?, err:NSError?) -> Void in
            
            
            let image = UIImage(data: data!)
            
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.imageUrl.image = image
                })            
        }
        task.resume()
    }
    
    
    var number1 = 0
    var number2 = 0
    @IBAction func doAsyncSerial(sender: AnyObject) {
        let queue = dispatch_queue_create("Queue", DISPATCH_QUEUE_CONCURRENT)
        dispatch_async(queue, { () -> Void in
            for i in 1...10 {
                self.number1 = self.number1 + 1
                NSThread.sleepForTimeInterval(0.1)
                if i == 10 {
                    print("number1 \(self.number1) number2 \(self.number2)")
                }
            } })
        print("dispatch_async1")
        dispatch_async(queue, { () -> Void in
            
            for _ in 1...10 {
                self.number2 = self.number2 + 1
            }
            print ("number1 \(self.number1) number2 \(self.number2)")
        })
        print("dispatch_async2")
        
        
    }
    
    @IBAction func syncConcurrent(sender: AnyObject) {
        let queue = dispatch_queue_create("Queue", DISPATCH_QUEUE_CONCURRENT)
        dispatch_sync(queue, { () -> Void in
            for i in 1...10 {
                self.number1 = self.number1 + 1
                NSThread.sleepForTimeInterval(0.1)
                if i == 10 {
                    print("number1 \(self.number1) number2 \(self.number2)")
                }
            } })
        print("dispatch_async1")
        dispatch_async(queue, { () -> Void in
            
            for _ in 1...10 {
                self.number2 = self.number2 + 1
            }
            print ("number1 \(self.number1) number2 \(self.number2)")
        })
        print("dispatch_async2")
        
        
        
        
    }
    
    
    
}