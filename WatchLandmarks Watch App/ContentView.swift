//
//  ContentView.swift
//  WatchLandmarks Watch App
//
//  Created by Quien on 2025-10-24.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    LandmarkList()
      .task {
        let center = UNUserNotificationCenter.current()
        _ = try? await center.requestAuthorization(
          options: [.alert, .sound, .badge]
        )
      }
  }
}

#Preview {
  ContentView()
    .environment(LandmarkViewModel())
}
