//
//  AppStateManager.swift
//  AmazingMessenger
//
//  Created by Александр Семёнов on 15.01.2025.
//

enum AppState: String {
    case notRunning = "Not Running"
    case inactive = "Inactive"
    case active = "Active"
    case background = "Background"
    case suspended = "Suspended"
}

final class AppStateManager {
    static let shared = AppStateManager()
    
    private var currentState: AppState = .notRunning {
        didSet {
            CosoleLogger.i("Application moved from \(oldValue) to \(currentState)")
        }
    }
    
    private init() {}
    
    func changeAppState(newState: AppState) {
        currentState = newState
    }
}
