//
//  FeatureCard.swift
//  Landmarks
//
//  Created by Quien on 2025-10-22.
//

import SwiftUI

struct FeatureCard: View {
  let landmark: Landmark
  
  var body: some View {
    landmark.featureImage?
      .resizable()
      .overlay {
        TextOverlay(landmark: landmark)
      }
  }
}

struct TextOverlay: View {
  let landmark: Landmark
  
  var gradient: LinearGradient {
    .linearGradient(
      Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
      startPoint: .bottom,
      endPoint: .center)
  }
  
  var body: some View {
    ZStack(alignment: .bottomLeading) {
      gradient
      VStack(alignment: .leading) {
        Text(landmark.name)
          .font(.title)
          .bold()
        Text(landmark.park)
      }
      .padding()
    }
    .foregroundStyle(.white)
  }
}

#Preview {
  FeatureCard(landmark: LandmarkViewModel().features[0])
    .aspectRatio(3 / 2, contentMode: .fit)
}
