//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Quien on 2025-10-24.
//

import SwiftUI

struct LandmarkList: View {
  @Environment(LandmarkViewModel.self) private var viewModel
  @State private var isShowFavoritesOnly = false

  var body: some View {
    NavigationSplitView {
      List {
        Toggle(isOn: $isShowFavoritesOnly) {
          Text("Favorites only")
        }
        .onChange(of: isShowFavoritesOnly) {
          viewModel.filterLandmarks(
            for: .all,
            isShowFavoritesOnly: isShowFavoritesOnly
          )
        }
        
        ForEach(viewModel.filteredLandmarks) { landmark in
          NavigationLink {
            LandmarkDetail(landmark: landmark)
          } label: {
            LandmarkRow(landmark: landmark)
          }
        }
      } // List
      .animation(.default, value: viewModel.filteredLandmarks)
      .navigationTitle("Landmarks")
    } detail: {
      Text("Select a Landmark")
    } // NavigationSplitView
  }
}

#Preview {
  LandmarkList()
    .environment(LandmarkViewModel())
}
