//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Quien on 2025-10-21.
//

import SwiftUI

@main
struct LandmarksApp: App {
  @State private var modelData = ModelData()
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(modelData)
    }
  }
}
