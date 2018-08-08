//
//  AppDelegate.swift
//  Deeplinks
//
//  Created by Dang Quoc Huy on 8/8/18.
//  Copyright © 2018 Dang Quoc Huy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    return true
  }
  
  func applicationDidBecomeActive(_ application: UIApplication) {
    // handle any deeplink
    Deeplinker.checkDeepLink()
  }
  
  func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
    completionHandler(Deeplinker.handleShortcut(item: shortcutItem))
  }
  
  // MARK: - Deeplinks
  func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
    return Deeplinker.handleDeeplink(url: url)
  }
  
  // MARK: - Universal Links
  func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
    if userActivity.activityType == NSUserActivityTypeBrowsingWeb {
      if let url = userActivity.webpageURL {
        return Deeplinker.handleDeeplink(url: url)
      }
    }
    return false
  }

}

