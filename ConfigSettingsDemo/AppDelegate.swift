//
//  AppDelegate.swift
//  ConfigSettingsDemo
//
//  Created by Hiren Kadam on 08/07/20.
//  Copyright © 2020 Hiren Kadam. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //setEnv()
        setEnvFromSettings()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    //MARK: Sets the base url depending upon the type of build schema you selected from top left corner while running the build
    func setEnv() {
        #if DEBUG
            baseURL = "https://www.google.com"
        #elseif STAGING
            baseURL = "https://www.facebook.com"
        #elseif TESTING
            baseURL = "https://www.linkedin.com"
        #elseif PRODUCTION
            baseURL = "https://www.instagram.com"
        #elseif RELEASE
            baseURL = "https://www.youtube.com"
        #endif
    }

    //MARK: Sets the base url depending upon schema selected in Settings
    
    enum UserSchema:String {
        case debug = "DEBUG"
        case staging = "STAGING"
        case testing = "TESTING"
        case production = "PRODUCTION"
        case release = "RELEASE"
    }
    
    var userSchema: UserSchema?
    
    func setEnvFromSettings() {
        let userDefaults = UserDefaults.standard
        let userSchemaStr = userDefaults.string(forKey: "user_type") ?? ""
        
        userSchema = UserSchema(rawValue: userSchemaStr)
        
        switch userSchema {
        case .debug:
            baseURL = "https://www.google.com"
        case .staging:
            baseURL = "https://www.facebook.com"
        case .testing:
            baseURL = "https://www.linkedin.com"
        case .production:
            baseURL = "https://www.instagram.com"
        case .release:
            baseURL = "https://www.youtube.com"
        case .none:
            baseURL = ""
        }
    }
}

