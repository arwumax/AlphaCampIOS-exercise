//
//  ViewController.swift
//  firebasepractice
//
//  Created by WuKwok Ho on 29/3/2016.
//  Copyright © 2016 Wu Kwok Ho. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit
import FBSDKShareKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loadImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doFirst(sender: AnyObject) {
        
        // Create a reference to a Firebase Location
        let rootRef = Firebase(url: "https://blinding-inferno-2974.firebaseio.com")
        
        let userRef = rootRef.childByAppendingPath("student")
        
        let userTom = ["name": "Tom", "age":"15"]
        let userMary = ["name": "Mary", "age":"17"]
        
        let tomRef = userRef.childByAutoId()
        let maryRef = userRef.childByAutoId()
        
        //Write data to firebase
        tomRef.setValue(userTom)
        maryRef.setValue(userMary)
    }
    
    

    @IBAction func secondbutton(sender: AnyObject) {
        let studentsRef = Firebase(url: "https://blinding-inferno-2974.firebaseio.com/student")
        
        /*     studentsRef.observeEventType(.ChildAdded, withBlock: { snapshot in    */
        //show all data
        
        
            //read data from specific characteristic, eg. students who are aged 15
        studentsRef.queryOrderedByChild("age").queryEqualToValue("15").observeEventType(.ChildAdded, withBlock: {
            snapshot in
            print(snapshot.value.objectForKey("name"))
            print(snapshot.value.objectForKey("age"))
        })
        
    }
    
    @IBAction func testing1Button(sender: AnyObject) {
        let alphaCampRef = Firebase(url: "https://blinding-inferno-2974.firebaseio.com/alphaCamp")
        let eventRef = alphaCampRef.childByAppendingPath("events")
        
        let event1 = ["name": "marketing", "date": "Monday", "time":"7 o'clock"]
        let event2 = ["name": "product design", "date": "tuesday", "time":"8 o'clock"]
        
        let event1Ref = eventRef.childByAutoId()
        let event2Ref = eventRef.childByAutoId()
        
        event1Ref.setValue(event1)
        event2Ref.setValue(event2)
        
    }
    
    @IBAction func buttonUpload(sender: AnyObject) {
        // 把圖片上載至firebase
        let image = UIImage(named:"demo")
        let imageData = UIImageJPEGRepresentation(image!, 1.0)
        let imageString = imageData?.base64EncodedStringWithOptions(NSDataBase64EncodingOptions())
        
        let imageRef = Firebase(url:"https://blinding-inferno-2974.firebaseio.com/image")
        let photoRef = imageRef.childByAppendingPath("photo1")
        photoRef.setValue(imageString)
        
        //自己練習download
        
    }
    
    @IBAction func buttonDownload(sender: AnyObject) {
        let image1Ref = Firebase(url:"https://blinding-inferno-2974.firebaseio.com/image/photo1")
        image1Ref.observeEventType(.Value, withBlock: { snapshot in
            let imageString = snapshot.value as! String
            let imageData = NSData(base64EncodedString: imageString, options: NSDataBase64DecodingOptions())
            let image = UIImage(data: imageData!)
            self.loadImage.image = image
            
            })

    }
    
    
    @IBAction func fbLoginbutton(sender: AnyObject) {
        let ref = Firebase(url: "https://blinding-inferno-2974.firebaseio.com")
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logInWithReadPermissions(["email"], fromViewController: self, handler: {
            (facebookResult, facebookError) -> Void in
            
            if facebookError != nil {
                print("Facebook login failed. Error \(facebookError)")
            } else if facebookResult.isCancelled {
                print("Facebook login was cancelled.")
            } else {
                let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                
                ref.authWithOAuthProvider("facebook", token: accessToken,
                    withCompletionBlock: { error, authData in
                        
                        if error != nil {
                            print("Login failed. \(error)")
                        } else {
                            print("Logged in! \(authData)")
                        }
                })
            }
        })
        
        
    }
    
    
    @IBAction func doFBWrite(sender: AnyObject) {
        let rootRef = Firebase(url: "https://blinding-inferno-2974.firebaseio.com")
        let userRef = rootRef.childByAppendingPath("users")
        
        let userdata = ["name":"Max", "Age":"17"]
        
        let maxRef = userRef.childByAppendingPath(rootRef.authData.uid)
        maxRef.setValue(userdata)
        
    }
    
    
}

