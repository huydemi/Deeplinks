//
//  ViewController.swift
//  Deeplinks
//
//  Created by Dang Quoc Huy on 8/8/18.
//  Copyright © 2018 Dang Quoc Huy. All rights reserved.
//

import UIKit

enum ProfileType: String {
  case guest = "Guest" // default
  case host = "Host"
}

class ViewController: UIViewController {
  
  var currentProfile = ProfileType.guest
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureFor(profileType: currentProfile)
  }
  
  @IBAction func didPressSwitchProfile(_ sender: Any) {
    currentProfile = currentProfile == .guest ? .host : .guest
    configureFor(profileType: currentProfile)
  }
  
  func configureFor(profileType: ProfileType) {
    title = profileType.rawValue
    ShortcutParser.shared.registerShortcuts(for: profileType)
  }
  
}

