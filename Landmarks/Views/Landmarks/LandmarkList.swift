//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Quien on 2025-10-21.
//

import SwiftUI

struct LandmarkList: View {
  @Environment(LandmarkViewModel.self) private var viewModel
  @State private var selectedLandmarkID: Landmark.ID?
  
  var landmarksTitle: String {
    let title = viewModel.selectedCategory == .all ? "Landmarks" : viewModel.selectedCategory.rawValue
    return "\(viewModel.isShowFavoritesOnly ? "Favorite " : "")\(title)"
  }
  
  var body: some View {
    @Bindable var viewModel = viewModel
    
    NavigationSplitView {
      List(
        viewModel.filteredLandmarks,
        selection: $selectedLandmarkID
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
            Picker("Category", selection: $viewModel.selectedCategory) {
              ForEach(FilterCategory.allCases) { category in
                Text(category.rawValue).tag(category)
              }
            }
            .pickerStyle(.inline)
            
            Toggle(isOn: $viewModel.isShowFavoritesOnly) {
              Label("Favorites only", systemImage: "star.fill")
            }
          } label: {
            Label("Filter", systemImage: "slider.horizontal.3")
          } // Menu
        } // ToolbarItem
      } // toolbar
    } detail: {
      if let id = selectedLandmarkID,
         let bindingLandmark = viewModel.binding(for: id) {
        LandmarkDetail(landmark: bindingLandmark)
      } else {
        Text("Select a Landmark")
      }
    } // NavigationSplitView
    #if os(macOS)
    .focusedValue(\.selectedLandmark, bindingForSelectedLandmark)
    #endif
  }
  
  private var bindingForSelectedLandmark: Binding<Landmark>? {
    if let id = selectedLandmarkID,
       let bindingLandmark = viewModel.binding(for: id) {
      return bindingLandmark
    }
    return nil
  }
}

#Preview {
  LandmarkList()
    .environment(LandmarkViewModel())
}
