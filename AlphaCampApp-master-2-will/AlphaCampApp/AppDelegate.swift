//
//  AppDelegate.swift
//  AlphaCampApp
//
//  Created by 建達 陳 on 2016/4/1.
//  Copyright © 2016年 Alpha Camp. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let userDefault = NSUserDefaults.standardUserDefaults()
        let auth_token = userDefault.objectForKey("auth_token")
        
        if auth_token == nil {
            let storyboard: UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
            let loginView: Login = storyboard.instantiateViewControllerWithIdentifier("loginView") as! Login
            self.window?.makeKeyAndVisible()
            self.window?.rootViewController?.presentViewController(loginView, animated: true, completion: nil)
        }
        if auth_token != nil {
            Alamofire.request(.GET, urlforAllCourse, parameters: ["auth_token":auth_token!, "api_key":"ef81632058bf2e75925f7f9d747a34df55d86072"]).responseJSON{ response in
                
                print(JSON(response.result.value!))
                course1Name = JSON(response.result.value!)["courses"][0]["name"].stringValue
                course2Name = JSON(response.result.value!)["courses"][1]["name"].stringValue
                course3Name = JSON(response.result.value!)["courses"][2]["name"].stringValue
                
                print("\(course1Name),\(course2Name),\(course3Name)")
            }
            
            Alamofire.request(.GET, urlCourse1, parameters: ["auth_token":auth_token!, "api_key":"ef81632058bf2e75925f7f9d747a34df55d86072"]).responseJSON{ response in
                
                let json = JSON(response.result.value!)
                jsonCourse1 = json
                print(jsonCourse1)
            }
            
            Alamofire.request(.GET, urlCourse2, parameters: ["auth_token":auth_token!, "api_key":"ef81632058bf2e75925f7f9d747a34df55d86072"]).responseJSON{ response in
                
                let json = JSON(response.result.value!)
                jsonCourse2 = json
            }
            
            Alamofire.request(.GET, urlCourse3, parameters: ["auth_token":auth_token!, "api_key":"ef81632058bf2e75925f7f9d747a34df55d86072"]).responseJSON{ response in
                
                let json = JSON(response.result.value!)
                jsonCourse3 = json
            }

            
            
        }
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

