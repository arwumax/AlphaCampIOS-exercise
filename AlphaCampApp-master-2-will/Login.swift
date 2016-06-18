//
//  Login.swift
//  AlphaCampApp
//
//  Created by 建達 陳 on 2016/4/1.
//  Copyright © 2016年 Alpha Camp. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Login: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func login(sender: AnyObject) {
        let url = "https://dojo.alphacamp.co/api/v1/login"
        let emailtext = email.text
        let passwordtext = password.text
        
        Alamofire.request(.POST, url, parameters: ["email": emailtext!, "password": passwordtext!, "api_key":"ef81632058bf2e75925f7f9d747a34df55d86072"]).responseJSON
            { response in
                
                if JSON(response.result.value!)["message"].stringValue == "Ok"{
                let auth_token = JSON(response.result.value!)["auth_token"].stringValue
                let userDefault = NSUserDefaults.standardUserDefaults()
                userDefault.setObject(auth_token, forKey: "auth_token")
                userDefault.synchronize()
                    
                self.dismissViewControllerAnimated(true, completion: nil)
                    
                }
                
                if JSON(response.result.value!)["message"].description == "Failed" {
                    let alert = UIAlertController(title: nil, message: "帳號或密碼有誤請重新輸入！", preferredStyle: .Alert)
                    let OK = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
                    alert.addAction(OK)
                    
                    self.presentViewController(alert, animated: true, completion: nil)
                    self.email.text = ""
                    self.password.text = ""
                    
                }
            }
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
