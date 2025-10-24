//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Quien on 2025-10-24.
//

import SwiftUI

struct LandmarkDetail: View {
  @Environment(LandmarkViewModel.self) var viewModel
  var landmark: Landmark
  
  var landmarkIndex: Int {
    viewModel.landmarks.firstIndex(where: { $0.id == landmark.id })!
  }
  
  var body: some View {
    @Bindable var viewModel = viewModel
    
    ScrollView {
      VStack {
        CircleImage(image: landmark.image.resizable())
          .scaledToFit()
        
        Text(landmark.name)
          .font(.headline)
          .lineLimit(0)
        
        Toggle(isOn: $viewModel.landmarks[landmarkIndex].isFavorite) {
          Text("Favorite")
        }
        
        Divider()
        
        Text(landmark.park)
          .font(.caption)
          .bold()
          .lineLimit(0)
        
        Text(landmark.state)
          .font(.caption)
        
        Divider()
        
        MapView(coordinate: landmark.locationCoordinate)
          .scaledToFit()
      }
      .padding(16)
    }
    .navigationTitle("Landmarks")
  }
}

#Preview {
  let viewModel = LandmarkViewModel()
  return LandmarkDetail(landmark: viewModel.landmarks[0])
    .environment(viewModel)
}
