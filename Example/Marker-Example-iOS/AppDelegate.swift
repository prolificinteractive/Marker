//
//  AppDelegate.swift
//  Marker-Example-iOS
//
//  Created by Htin Linn on 05/04/2016.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties

    var window: UIWindow?

    // MARK: - Private properties

    private let theme = AppTheme()

    // MARK: - Instance functions

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        if let viewController = window?.rootViewController as? ViewController {
            viewController.theme = theme
        }

        return true
    }
    
}

