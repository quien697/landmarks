//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Quien on 2025-10-21.
//

import SwiftUI

@main
struct LandmarksApp: App {
  @State private var viewModel = LandmarkViewModel()
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(viewModel)
    }
    #if !os(watchOS)
    .commands {
      LandmarkCommands()
    }
    #endif
    
    #if os(watchOS)
    WKNotificationScene(
      controller: NotificationController.self,
      category: "LandmarkNear"
    )
    #endif
    
    #if os(macOS)
    Settings {
      LandmarkSettings()
    }
    #endif
  }
}
