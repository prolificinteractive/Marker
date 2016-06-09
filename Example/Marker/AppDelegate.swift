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

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(5 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
            AppEnvironment.sharedEnvironment.fonts = HelveticaFonts()
        }
        
        return true
    }

}

