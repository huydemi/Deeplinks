//
//  DeeplinkParser.swift
//  Deeplinks
//
//  Created by Dang Quoc Huy on 8/8/18.
//  Copyright © 2018 Dang Quoc Huy. All rights reserved.
//

import Foundation

class DeeplinkParser {
  static let shared = DeeplinkParser()
  private init() { }
  
  func parseDeepLink(_ url: URL) -> DeeplinkType? {
    guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true), let host = components.host else {
      return nil
    }
    var pathComponents = components.path.components(separatedBy: "/")
    // the first component is empty
    pathComponents.removeFirst()
    switch host {
    case "messages":
      if let messageId = pathComponents.first {
        return DeeplinkType.messages(.details(id: messageId))
      }
    case "request":
      if let requestId = pathComponents.first {
        return DeeplinkType.request(id: requestId)
      }
    default:
      break
    }
    return nil
  }
  
}



