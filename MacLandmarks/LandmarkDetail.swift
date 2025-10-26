//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Quien on 2025-10-24.
//

import SwiftUI
import MapKit

struct LandmarkDetail: View {
  @Environment(LandmarkViewModel.self) private var viewModel
  var landmark: Landmark
  
  var landmarkIndex: Int {
    viewModel.filteredLandmarks.firstIndex(where: { $0.id == landmark.id })!
  }
  
  var body: some View {
    @Bindable var viewModel = viewModel
    
    ScrollView {
      ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
        MapView(coordinate: landmark.locationCoordinate)
          .frame(height: 300)
        
        Button("Open in Maps") {
          let destination = MKMapItem(placemark: MKPlacemark(coordinate: landmark.locationCoordinate))
          destination.name = landmark.name
          destination.openInMaps()
        }
        .padding()
      }
      
      VStack(alignment: .leading, spacing: 20) {
        HStack(spacing: 24) {
          CircleImage(image: landmark.image.resizable())
            .frame(width: 160, height: 160)
          
          VStack(alignment: .leading) {
            HStack {
              Text(landmark.name)
                .font(.title)
              
              if let index = viewModel.index(of: landmark) {
                FavoriteButton(isSet: $viewModel.filteredLandmarks[index].isFavorite)
              }
            
              
            }
            
            VStack(alignment: .leading) {
              Text(landmark.park)
              Text(landmark.state)
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)
          }
        }
        
        Divider()
        
        Text("About \(landmark.name)")
          .font(.title2)
        Text(landmark.description)
      }
      .padding()
      .frame(maxWidth: 700)
      .offset(y: -50)
    }
    .navigationTitle(landmark.name)
  }
}

#Preview {
  let viewModel = LandmarkViewModel()
  return LandmarkDetail(landmark: viewModel.filteredLandmarks[0])
    .environment(viewModel)
    .frame(width: 850, height: 700)
}
