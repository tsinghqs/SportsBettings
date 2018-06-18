//
//  AppDelegate.swift
//  SportsBetting
//
//  Created by Tarun Singh on 6/9/18.
//  Copyright © 2018 Tarun Singh. All rights reserved.
//

import UIKit
import AWSMobileClient
import AWSCore


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    // Add a AWSMobileClient call in application:open url
    func application(_ application: UIApplication, open url: URL,
                     sourceApplication: String?, annotation: Any) -> Bool {
        
        return AWSMobileClient.sharedInstance().interceptApplication(
            application, open: url,
            sourceApplication: sourceApplication,
            annotation: annotation)
        
    }
    
    // Add a AWSMobileClient call in application:didFinishLaunching
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions:
        [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        return AWSMobileClient.sharedInstance().interceptApplication(
            application, didFinishLaunchingWithOptions:
            launchOptions)
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Will implement later
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
       
        // Will Implement later
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        //Will implement later
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Will implement later
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Will implement later
    }


}

