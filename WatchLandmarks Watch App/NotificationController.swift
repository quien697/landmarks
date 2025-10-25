//
//  NotificationController.swift
//  Landmarks
//
//  Created by Quien on 2025-10-24.
//

import WatchKit
import SwiftUI
import UserNotifications

class NotificationController: WKUserNotificationHostingController<NotificationView> {
  var landmark: Landmark?
  var title: String?
  var message: String?
  
  let landmarkIndexKey = "landmarkIndex"
  
  override var body: NotificationView {
    NotificationView(
      title: title,
      message: message,
      landmark: landmark
    )
  }
  
  override func didReceive(_ notification: UNNotification) {
    let viewModel = LandmarkViewModel()
    
    let notificationData =
    notification.request.content.userInfo as? [String: Any]
    
    let aps = notificationData?["aps"] as? [String: Any]
    let alert = aps?["alert"] as? [String: Any]
    
    title = alert?["title"] as? String
    message = alert?["body"] as? String
    
    if let index = notificationData?[landmarkIndexKey] as? Int {
      landmark = viewModel.landmarks[index]
    }
  }
}
