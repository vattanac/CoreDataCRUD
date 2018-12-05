//
//  AppDelegate.swift
//  CoreDataDemo
//
//  Created by Vattanac on 12/5/18.
//  Copyright © 2018 vattanac. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let VC = ViewController(persistenceManager: PersistenceManager.share )
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = VC
        window?.makeKeyAndVisible()
        return true
    }
    
    
    
}

