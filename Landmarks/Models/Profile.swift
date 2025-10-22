//
//  Profile.swift
//  Landmarks
//
//  Created by Quien on 2025-10-22.
//

import Foundation

struct Profile {
  var username: String
  var prefersNotifications = true
  var seasonalPhoto = Season.summer
  var goalDate = Date()
  
  static let `default` = Profile(username: "Quien")
  
  enum Season: String, CaseIterable, Identifiable {
    case spring = "🌷"
    case summer = "🌞"
    case autumn = "🍂"
    case winter = "☃️"
    
    var id: String { rawValue }
  }
}
