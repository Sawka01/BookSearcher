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
        let bookSeracherViewController = BookSearcherViewController()
        let navigationController = UINavigationController(
            rootViewController: bookSeracherViewController
        )
        BookSearcherConfigurator().configure(with: bookSeracherViewController, navigationController: navigationController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
}

