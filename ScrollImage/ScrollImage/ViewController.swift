//
//  ViewController.swift
//  ScrollImage
//
//  Created by Edward Chiang on 3/15/16.
//  Copyright © 2016 Soleil Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Meet slide 8
//        self.addFromCode()
        self.addFromStoryboard()
        
        self.scrollView.delegate = self
    }
    
    func addFromCode() {
        let imageView = UIImageView(image: UIImage(named: "Zoo"))
        imageView.sizeToFit()
        self.contentView.addSubview(imageView)
        self.scrollView.contentSize = CGSize(width: CGRectGetWidth(imageView.frame), height: CGRectGetHeight(imageView.frame))
    }
    
    func addFromStoryboard() {
        contentImageView.image = UIImage(named: "Zoo")
        contentImageView.sizeToFit()
        self.scrollView.contentSize = CGSize(width: CGRectGetWidth(contentImageView.frame), height: CGRectGetHeight(contentImageView.frame))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.contentImageView
    }

}

