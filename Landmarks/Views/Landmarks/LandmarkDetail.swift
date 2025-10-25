//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Quien on 2025-10-21.
//

import SwiftUI

struct LandmarkDetail: View {
  @Environment(LandmarkViewModel.self) var viewModel
  var landmark: Landmark
  
  var body: some View {
    ScrollView {
      MapView(coordinate: landmark.locationCoordinate)
        .frame(height: 300)
      
      CircleImage(image: landmark.image)
        .offset(y: -130)
        .padding(.bottom, -130)
      
      VStack(alignment: .leading) {
        HStack {
          Text(landmark.name)
            .font(.title)
          
          FavoriteButton(isSet: landmark.isFavorite) {
            viewModel.toggleFavorite(for: landmark.id)
          }
        } // HStack
        
        HStack {
          Text(landmark.park)
          
          Spacer()
          
          Text(landmark.state)
        } // HStack
        .font(.subheadline)
        .foregroundStyle(.secondary)
        
        Divider()
        
        Text("About \(landmark.name)")
          .font(.title2)
        
        Text(landmark.description)
      } // VStack
      .padding()
    } // ScrollView
    .navigationTitle(landmark.name)
    .navigationBarTitleDisplayMode(.inline)
  }
}

#Preview {
  let viewModel = LandmarkViewModel()
  
  return LandmarkDetail(landmark: viewModel.landmarks[0])
    .environment(viewModel)
}
