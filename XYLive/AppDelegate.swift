//
//  AppDelegate.swift
//  XYLive
//
//  Created by xiyan on 2018/9/10.
//  Copyright © 2018年 xiyan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let vc = MainViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }
}

