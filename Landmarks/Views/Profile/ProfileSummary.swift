//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Quien on 2025-10-22.
//

import SwiftUI

struct ProfileSummary: View {
  @Environment(LandmarkViewModel.self) var viewModel
  let profile: Profile
  
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 10) {
        Text(profile.username)
          .bold()
          .font(.title)
        
        Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
        
        Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
        
        Text("Goal Date: \(profile.goalDate.formatted(date: .long, time: .omitted))")
        
        Divider()
        
        VStack(alignment: .leading) {
          Text("Completed Badges")
            .font(.headline)
          
          ScrollView(.horizontal) {
            HStack {
              HikeBadge(name: "First Hike")
              HikeBadge(name: "Earth Day")
                .hueRotation(Angle(degrees: 90))
              HikeBadge(name: "Tenth Hike")
                .grayscale(0.5)
                .hueRotation(Angle(degrees: 45))
            }
            .padding(.bottom)
          }
        }
        
        Divider()
        
        VStack(alignment: .leading) {
          Text("Recent Hikes")
            .font(.headline)
          
          HikeView(hike: viewModel.hikes[0])
        }
      } // VStack
      .padding()
    } // ScrollView
  }
}

#Preview {
  ProfileSummary(profile: Profile.default)
    .environment(LandmarkViewModel())
}
