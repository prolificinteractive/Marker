//
//  AppDelegate.swift
//  Marker
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
    
    private var theme: AppTheme!

    // MARK: - Instance functions
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        theme = AppTheme()
        
        if let viewController = window?.rootViewController as? ViewController {
            viewController.theme = theme
        }
        
        return true
    }

}

