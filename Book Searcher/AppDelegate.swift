//
//  AppDelegate.swift
//  Book Searcher
//
//  Created by Khushvaktov Temur on 06.08.2021.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()

        return true
    }
}

