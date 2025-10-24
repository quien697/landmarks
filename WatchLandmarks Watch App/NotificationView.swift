//
//  NotificationView.swift
//  Landmarks
//
//  Created by Quien on 2025-10-24.
//

import SwiftUI

struct NotificationView: View {
  var title: String?
  var message: String?
  var landmark: Landmark?
  
  var body: some View {
    VStack {
      if let landmark {
        CircleImage(image: landmark.image.resizable())
          .scaledToFit()
      }
      
      Text(title ?? "Unknown Landmark")
        .font(.headline)
      
      Divider()
      
      Text(message ?? "You are within 5 miles of one of your favorite landmarks.")
        .font(.caption)
    } // VStack
  }
}

#Preview {
  NotificationView()
}

#Preview {
  NotificationView(
    title: "Turtle Rock",
    message: "You are within 5 miles of Turtle Rock.",
    landmark: LandmarkViewModel().landmarks[0])
}
