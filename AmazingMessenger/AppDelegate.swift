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
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let firstVC = ConversationsListViewController()
        let navigationController = UINavigationController(rootViewController: firstVC)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
    
    
    func applicationDidBecomeActive(_: UIApplication) {
        AppStateManager.shared.changeAppState(newState: .active)
    }
    
    func applicationWillResignActive(_: UIApplication) {
        AppStateManager.shared.changeAppState(newState: .inactive)
    }
    
    func applicationDidEnterBackground(_: UIApplication) {
        AppStateManager.shared.changeAppState(newState: .background)
    }
    
    func applicationWillEnterForeground(_: UIApplication) {
        AppStateManager.shared.changeAppState(newState: .inactive)
    }
    
    func applicationWillTerminate(_: UIApplication) {
        AppStateManager.shared.changeAppState(newState: .notRunning)
    }
}

