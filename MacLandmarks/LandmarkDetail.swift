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
  @Binding var landmark: Landmark
  
  var landmarkIndex: Int {
    viewModel.filteredLandmarks.firstIndex(where: { $0.id == landmark.id })!
  }
  
  var body: some View {
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
              
              FavoriteButton(isSet: $landmark.isFavorite)
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
  
  if let bindingLandmark = viewModel.binding(for: viewModel.filteredLandmarks.first!.id) {
    LandmarkDetail(landmark: bindingLandmark)
      .environment(viewModel)
      .frame(width: 850, height: 700)
  }
}
