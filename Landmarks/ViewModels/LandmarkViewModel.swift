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
  
  var landmarks: [Landmark] = []
  var hikes: [Hike] = []
  var profile = Profile.default
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
  
  func toggleFavorite(for id: Int) {
    guard let index = landmarks.firstIndex(where: { $0.id == id }) else { return }
    landmarks[index].isFavorite.toggle()
  }
}
