//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Quien on 2025-10-24.
//

import SwiftUI

struct LandmarkDetail: View {
  @Environment(LandmarkViewModel.self) private var viewModel
  let landmark: Landmark

  var body: some View {
    @Bindable var viewModel = viewModel
    
    ScrollView {
      VStack {
        CircleImage(image: landmark.image.resizable())
          .scaledToFit()
        
        Text(landmark.name)
          .font(.headline)
          .lineLimit(0)
        
        if let index = viewModel.index(of: landmark) {
          Toggle(isOn: $viewModel.filteredLandmarks[index].isFavorite) {
            Text("Favorite")
          }
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
      } // VStack
      .padding(16)
    } // ScrollView
    .navigationTitle("Landmarks")
  }
}

#Preview {
  let viewModel = LandmarkViewModel()
  
  return LandmarkDetail(landmark: viewModel.filteredLandmarks[0])
    .environment(viewModel)
}
