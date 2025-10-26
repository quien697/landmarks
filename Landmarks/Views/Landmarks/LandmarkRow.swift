//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Quien on 2025-10-21.
//

import SwiftUI

struct LandmarkRow: View {
  var landmark: Landmark
  
  var body: some View {
    HStack {
      landmark.image
        .resizable()
        .frame(width: 50, height: 50)
        .cornerRadius(5)
      
      VStack(alignment: .leading) {
        Text(landmark.name)
          .bold()
        
        #if !os(watchOS)
        Text(landmark.park)
          .font(.caption)
          .foregroundStyle(.secondary)
        #endif
      } // VStack
      
      Spacer()
      
      if landmark.isFavorite {
        Image(systemName: "star.fill")
          .foregroundStyle(.yellow)
      }
    } // HStack
    .padding(.vertical, 4)
  }
}

#Preview {
  let landmarks = LandmarkViewModel().filteredLandmarks
  
  return Group {
    LandmarkRow(landmark: landmarks[0])
    LandmarkRow(landmark: landmarks[1])
  }
}
