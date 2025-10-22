//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Quien on 2025-10-21.
//

import SwiftUI

struct LandmarkList: View {
  @Environment(LandmarkViewModel.self) var viewModel
  @State private var isShowFavorites = false

  var filteredLandmarks: [Landmark] {
    viewModel.landmarks.filter { landmark in
      (!isShowFavorites || landmark.isFavorite)
    }
  }
  
  var body: some View {
    NavigationSplitView {
      List {
        Toggle(isOn: $isShowFavorites) {
          Text("Favorites only")
        }
        
        ForEach(filteredLandmarks) { landmark in
          NavigationLink {
            LandmarkDetail(landmark: landmark)
          } label: {
            LandmarkRow(landmark: landmark)
          }
        }
      } // List
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
