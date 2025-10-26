//
//  LandmarkViewModel.swift
//  Landmarks
//
//  Created by Quien on 2025-10-22.
//

import SwiftUI

@Observable
class LandmarkViewModel {
  private let webService = WebService()
  private(set) var landmarks: [Landmark] = []
  
  var isShowFavoritesOnly: Bool = false
  var selectedCategory: FilterCategory = .all
  var filteredLandmarks: [Landmark] {
    landmarks.filter { landmark in
      (!isShowFavoritesOnly || landmark.isFavorite) &&
      (selectedCategory == .all || landmark.category.rawValue == selectedCategory.rawValue)
    }
  }
  
  var hikes: [Hike] = []
  var profile: Profile = .default
  
  var features: [Landmark] {
    landmarks.filter { $0.isFeatured }
  }
  var categories: [String: [Landmark]] {
    Dictionary(
      grouping: landmarks,
      by: { $0.category.rawValue }
    )
  }
  
  init() {
    loadData()
  }
  
  private func loadData() {
    if let data: [Landmark] = webService.loadLocalData(filename: "landmarkData") {
      landmarks = data
    }
    
    if let data: [Hike] = webService.loadLocalData(filename: "hikeData") {
      hikes = data
    }
  }
  
  func index(of landmark: Landmark) -> Int? {
    filteredLandmarks.firstIndex(where: { $0.id == landmark.id })
  }
  
  func isFavoriteBinding(for landmark: Landmark) -> Binding<Bool>? {
    guard let index = index(of: landmark) else { return nil }
    
    return Binding(
      get: { self.landmarks[index].isFavorite },
      set: { self.landmarks[index].isFavorite = $0 }
    )
  }
}
