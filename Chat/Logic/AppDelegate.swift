//
//  AppDelegate.swift
//  Chat
//
//  Created by Paweł Bednorz on 23/06/2021.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private enum Constants {
        static let sceneConfigurationName = "Default Configuration"
    }

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    // MARK: - UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: Constants.sceneConfigurationName,
                                    sessionRole: connectingSceneSession.role)
    }
}

