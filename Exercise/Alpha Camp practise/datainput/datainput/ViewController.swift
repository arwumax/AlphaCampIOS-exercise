//
//  ViewController.swift
//  datainput
//
//  Created by WuKwok Ho on 21/3/2016.
//  Copyright © 2016 Wu Kwok Ho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet weak var readData: UILabel!
    
    @IBOutlet weak var readDataTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func readFile(sender: AnyObject) {

        do{
            let path = NSBundle.mainBundle().pathForResource("poem", ofType: "txt")
            
            let content = try String(contentsOfFile: path!)
            
            readData.text = content
            
            readDataTextView.text = content
            
            
        }catch {
            print("File not Found")
            
        }
        }

        
    }



