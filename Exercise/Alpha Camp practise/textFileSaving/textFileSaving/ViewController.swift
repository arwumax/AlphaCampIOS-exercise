//
//  ViewController.swift
//  textFileSaving
//
//  Created by WuKwok Ho on 22/3/2016.
//  Copyright © 2016 Wu Kwok Ho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet weak var movieText: UITextView!
    
    var array: NSMutableArray = ["Tom, where are you", "Mary, I am here.", "John, Thank you!"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var home = NSHomeDirectory()
        home = home.stringByAppendingString("/Documents/movie.txt")
        
        if let ar = NSMutableArray(contentsOfFile: home){
            array = ar
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        movieText.text = ""
        for title in array {
            let movieText: String = "\(title)\n"
            movieText.text?.appendContentsOf(title as! String)}
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doNSHome(sender: AnyObject) {
        let home = NSHomeDirectory().stringByAppendingString("/data.txt")
        let homes = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        
/*        let fileManger = NSFileManager.defaultManager()
        let homes = fileManger.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        
        let home = homes.first
        let url = home?.URLByAppendingPathComponent("data.txt")
        
        let array: NSArray = ["Tom", "Mary", "John"]
        array.writeToURL(url!, atomically: true)
        
       let readArray = NSArray(contentsOfURL: url!)
       for name in readArray! {
        print(name)
        
        }
        print("Home: \(url)")
    }
    

}