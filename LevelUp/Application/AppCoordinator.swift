//
//  AppCoordinator.swift
//  LevelUp
//
//  Created by Salvador Chavez on 23/06/25.
//


import UIKit

class AppCoordinator {
    private let window: UIWindow
    private let navigationController: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initialVC = storyboard.instantiateInitialViewController()!
        navigationController.viewControllers = [initialVC]
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
