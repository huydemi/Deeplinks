//
//  NotificationParser.swift
//  Deeplinks
//
//  Created by Dang Quoc Huy on 8/8/18.
//  Copyright © 2018 Dang Quoc Huy. All rights reserved.
//

import Foundation

class NotificationParser {
  static let shared = NotificationParser()
  private init() { }
  
  func handleNotification(_ userInfo: [AnyHashable : Any]) -> DeeplinkType? {
    if let data = userInfo["data"] as? [String: Any] {
      if let messageId = data["messageId"] as? String {
        return DeeplinkType.messages(.details(id: messageId))
      }
      if let requestId = data["requestId"] as? String {
        return DeeplinkType.request(id: requestId)
      }
    }
    return nil
  }

}
