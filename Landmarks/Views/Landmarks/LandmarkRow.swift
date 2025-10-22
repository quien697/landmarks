//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Quien on 2025-10-21.
//

import SwiftUI

struct LandmarkRow: View {
  let landmark: Landmark
  
  var body: some View {
    HStack {
      landmark.image
        .resizable()
        .frame(width: 50, height: 50)
      
      Text(landmark.name)
      
      Spacer()
      
      if landmark.isFavorite {
        Image(systemName: "star.fill")
          .foregroundStyle(.yellow)
      }
    }
  }
}

#Preview {
  let landmarks = LandmarkViewModel().landmarks
  return LandmarkRow(landmark: landmarks[0])
}

#Preview {
  let landmarks = LandmarkViewModel().landmarks
  return LandmarkRow(landmark: landmarks[1])
}
