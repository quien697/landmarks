//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Quien on 2025-10-21.
//

import SwiftUI

struct LandmarkDetail: View {
  @Environment(LandmarkViewModel.self) private var viewModel
  @Binding var landmark: Landmark
  
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
          
          FavoriteButton(isSet: $landmark.isFavorite)
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
  
  if let bindingLandmark = viewModel.binding(for: viewModel.filteredLandmarks.first!.id) {
    LandmarkDetail(landmark: bindingLandmark)
      .environment(viewModel)
      .frame(width: 850, height: 700)
  }
}
