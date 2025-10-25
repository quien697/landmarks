//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Quien on 2025-10-21.
//

import SwiftUI

struct LandmarkList: View {
  @Environment(LandmarkViewModel.self) private var viewModel
  @State private var isShowFavoritesOnly: Bool = false
  @State private var selectedCategory: FilterCategory = .all
  @State private var selectedLandmark: Landmark?
  var landmarksTitle: String {
    let title = selectedCategory == .all ? "Landmarks" : selectedCategory.rawValue
    return "Favorite \(isShowFavoritesOnly ? title : "")"
  }
  
  var body: some View {
    NavigationSplitView {
      List(
        viewModel.filteredLandmarks,
        selection: $selectedLandmark
      ) { landmark in
        NavigationLink(value: landmark) {
          LandmarkRow(landmark: landmark)
        }
      } // List
      .animation(.default, value: viewModel.filteredLandmarks)
      .navigationTitle(landmarksTitle)
      .frame(minWidth: 300)
      .toolbar {
        ToolbarItem {
          Menu {
            Picker("Category", selection: $selectedCategory) {
              ForEach(FilterCategory.allCases) { category in
                Text(category.rawValue).tag(category)
              }
            }
            .pickerStyle(.inline)
            .onChange(of: selectedCategory) {
              viewModel.filterLandmarks(
                for: selectedCategory,
                isShowFavoritesOnly: isShowFavoritesOnly
              )
            }
            
            Toggle(isOn: $isShowFavoritesOnly) {
              Label("Favorites only", systemImage: "star.fill")
            }
            .onChange(of: isShowFavoritesOnly) {
              viewModel.filterLandmarks(
                for: selectedCategory,
                isShowFavoritesOnly: isShowFavoritesOnly
              )
            }
          } label: {
            Label("Filter", systemImage: "slider.horizontal.3")
          } // Menu
        } // ToolbarItem
      } // toolbar
    } detail: {
      if let landmark = selectedLandmark {
        LandmarkDetail(landmark: landmark)
      } else {
        Text("Select a Landmark")
      }
    } // NavigationSplitView
  }
}

#Preview {
  LandmarkList()
    .environment(LandmarkViewModel())
}
