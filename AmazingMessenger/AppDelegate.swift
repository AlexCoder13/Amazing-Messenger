//
//  AppDelegate.swift
//  AmazingMessenger
//
//  Created by Александр Семёнов on 09.01.2025.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            
            let window = UIWindow (frame: UIScreen.main.bounds)
            window.rootViewController = ViewController()
            window.makeKeyAndVisible()
            self.window = window
        
            return true
        }
    
    
    func applicationDidBecomeActive(_: UIApplication) {
        print("- Application moved from <Not Running/Inactive> to <Active>: <\(#function)>")
    }
    
    func applicationWillResignActive(_: UIApplication) {
        print("- Application moved from <Active> to <Inactive>: <\(#function)>")
    }
    
    func applicationDidEnterBackground(_: UIApplication) {
        print("- Application moved from <Inactive> to <Background>: <\(#function)>")
    }
    
    func applicationWillEnterForeground(_: UIApplication) {
        print("- Application moved from <Background> to <Inactive>: <\(#function)>")
    }
    
    func applicationWillTerminate(_: UIApplication) {
        print("- Application moved from <Inactive> to <Not Running>: <\(#function)>")
    }
}

