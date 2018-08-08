//
//  DeepLinkManager.swift
//  Deeplinks
//
//  Created by Dang Quoc Huy on 8/8/18.
//  Copyright © 2018 Dang Quoc Huy. All rights reserved.
//

import Foundation
import UIKit

enum DeeplinkType {
  enum Messages {
    case root
    case details(id: String)
  }
  case messages(Messages)
  case activity
  case newListing
  case request(id: String)
}

let Deeplinker = DeepLinkManager()
class DeepLinkManager {
  fileprivate init() {}
  
  private var deeplinkType: DeeplinkType?
  
  // check existing deepling and perform action
  func checkDeepLink() {
    guard let deeplinkType = deeplinkType else {
      return
    }
    
    DeeplinkNavigator.shared.proceedToDeeplink(deeplinkType)
    // reset deeplink after handling
    self.deeplinkType = nil // (1)
  }
  
  @discardableResult
  func handleShortcut(item: UIApplicationShortcutItem) -> Bool {
    deeplinkType = ShortcutParser.shared.handleShortcut(item)
    return deeplinkType != nil
  }
  
  @discardableResult
  func handleDeeplink(url: URL) -> Bool {
    deeplinkType = DeeplinkParser.shared.parseDeepLink(url)
    return deeplinkType != nil
  }
  
}
