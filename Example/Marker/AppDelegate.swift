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

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        if let viewController = window?.rootViewController as? ViewController {
            let fonts: Fonts = PabloFonts()
            let fontTheme: FontTheme = PabloFontTheme(fonts: fonts)
            
            viewController.fontTheme = fontTheme
        }
        
        return true
    }

}

