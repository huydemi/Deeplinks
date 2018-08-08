//
//  DeeplinkNavigator.swift
//  Deeplinks
//
//  Created by Dang Quoc Huy on 8/8/18.
//  Copyright © 2018 Dang Quoc Huy. All rights reserved.
//

import Foundation
import UIKit

class DeeplinkNavigator {
  static let shared = DeeplinkNavigator()
  private init() { }
  
  private var alertController = UIAlertController()
  
  func proceedToDeeplink(_ type: DeeplinkType) {
    switch type {
    case .activity:
      displayAlert(title: "Activity")
    case .messages(.root):
      displayAlert(title: "Messages Root")
    case .messages(.details(id: let id)):
      displayAlert(title: "Messages Details \(id)")
    case .newListing:
      displayAlert(title: "New Listing")
    case .request(id: let id):
      displayAlert(title: "Request Details \(id)")
    }
  }
  
  private func displayAlert(title: String) {
    alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
    let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
    alertController.addAction(okButton)
    if let vc = UIApplication.shared.keyWindow?.rootViewController {
      if vc.presentedViewController != nil {
        alertController.dismiss(animated: false, completion: {
          vc.present(self.alertController, animated: true, completion: nil)
        })
      } else {
        vc.present(alertController, animated: true, completion: nil)
      }
    }
  }

}
