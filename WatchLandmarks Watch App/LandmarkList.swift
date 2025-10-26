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
    @Bindable var viewModel = viewModel
    
    NavigationStack {
      List {
        Toggle(isOn: $viewModel.isShowFavoritesOnly) {
          Text("Favorites only")
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
    } // NavigationStack
  }
}

#Preview {
  LandmarkList()
    .environment(LandmarkViewModel())
}
