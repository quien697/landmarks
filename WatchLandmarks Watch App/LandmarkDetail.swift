//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Quien on 2025-10-24.
//

import SwiftUI

struct LandmarkDetail: View {
  @Environment(LandmarkViewModel.self) private var viewModel
  @Binding var landmark: Landmark

  var body: some View {
    ScrollView {
      VStack {
        CircleImage(image: landmark.image.resizable())
          .scaledToFit()
        
        Text(landmark.name)
          .font(.headline)
          .lineLimit(0)
        
        Toggle(isOn: $landmark.isFavorite) {
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
      } // VStack
      .padding(16)
    } // ScrollView
    .navigationTitle("Landmarks")
  }
}

#Preview {
  let viewModel = LandmarkViewModel()
  
  if let bindingLandmark = viewModel.binding(for: viewModel.filteredLandmarks.first!.id) {
    LandmarkDetail(landmark: bindingLandmark)
      .environment(viewModel)
      .frame(width: 850, height: 700)
  }
}
