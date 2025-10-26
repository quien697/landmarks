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
  @State private var filter = FilterCategory.all
  @State private var selectedLandmark: Landmark?
  
  enum FilterCategory: String, CaseIterable, Identifiable {
    case all = "All"
    case lakes = "Lakes"
    case rivers = "Rivers"
    case mountains = "Mountains"
    
    var id: FilterCategory { self }
  }
  
  var filteredLandmarks: [Landmark] {
    viewModel.filteredLandmarks.filter { landmark in
      (!showFavoritesOnly || landmark.isFavorite)
      && (filter == .all || filter.rawValue == landmark.category.rawValue)
    }
  }
  
  var title: String {
    let title = filter == .all ? "Landmarks" : filter.rawValue
    return showFavoritesOnly ? "Favorite \(title)" : title
  }
  
  var index: Int? {
    viewModel.filteredLandmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
  }
  
  var body: some View {
    @Bindable var viewModel = viewModel
    
    NavigationSplitView {
      List(selection: $selectedLandmark) {
        ForEach(filteredLandmarks) { landmark in
          NavigationLink {
            LandmarkDetail(landmark: landmark)
          } label: {
            LandmarkRow(landmark: landmark)
          }
          .tag(landmark)
        }
      }
      .animation(.default, value: filteredLandmarks)
      .navigationTitle(title)
      .frame(minWidth: 300)
      .toolbar {
        ToolbarItem {
          Menu {
            Picker("Category", selection: $filter) {
              ForEach(FilterCategory.allCases) { category in
                Text(category.rawValue).tag(category)
              }
            }
            .pickerStyle(.inline)
            
            Toggle(isOn: $showFavoritesOnly) {
              Label("Favorites only", systemImage: "star.fill")
            }
          } label: {
            Label("Filter", systemImage: "slider.horizontal.3")
          }
        }
      }
    } detail: {
      Text("Select a Landmark")
    }
    .focusedValue(\.selectedLandmark, $viewModel.filteredLandmarks[index ?? 0])
  }
}

#Preview {
  LandmarkList()
    .environment(LandmarkViewModel())
}
