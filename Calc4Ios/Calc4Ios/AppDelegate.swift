//
//  AppDelegate.swift
//  Calc4Ios
//
//  Created by Miguel Angel Fonseca Perez on 8/4/19.
//  Copyright © 2019 Miguel Angel Fonseca Perez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //setup
        setUpView()
        return true
    }

//mark- Here apprearing the principal functions
    private func setUpView(){
        window=UIWindow(frame: UIScreen.main.bounds)
        let vc = homeViewController()
        window?.rootViewController=vc
        window?.makeKeyAndVisible()
        
    }
}

