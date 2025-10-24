//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Quien on 2025-10-24.
//

import SwiftUI

struct LandmarkList: View {
  @Environment(LandmarkViewModel.self) var viewModel
  @State private var showFavoritesOnly = false
  
  var filteredLandmarks: [Landmark] {
    viewModel.landmarks.filter { landmark in
      (!showFavoritesOnly || landmark.isFavorite)
    }
  }
  
  var body: some View {
    NavigationSplitView {
      List {
        Toggle(isOn: $showFavoritesOnly) {
          Text("Favorites only")
        }
        
        ForEach(filteredLandmarks) { landmark in
          NavigationLink {
            LandmarkDetail(landmark: landmark)
          } label: {
            LandmarkRow(landmark: landmark)
          }
        }
      }
      .animation(.default, value: filteredLandmarks)
      .navigationTitle("Landmarks")
    } detail: {
      Text("Select a Landmark")
    }
  }
}

#Preview {
  LandmarkList()
    .environment(LandmarkViewModel())
}
