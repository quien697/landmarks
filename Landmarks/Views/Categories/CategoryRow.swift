//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Quien on 2025-10-22.
//

import SwiftUI

struct CategoryRow: View {
  @Environment(LandmarkViewModel.self) private var viewModel
  
  let categoryName: String
  let items: [Landmark]
  
  var body: some View {
    @Bindable var viewModel = viewModel
    
    VStack(alignment: .leading) {
      Text(categoryName)
        .font(.headline)
        .padding(.leading, 15)
        .padding(.top, 5)
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(alignment: .top, spacing: 0) {
          ForEach(items) { landmark in
            NavigationLink {
              if let bindingLandmark = viewModel.binding(for: landmark.id) {
                LandmarkDetail(landmark: bindingLandmark)
              } else {
                Text("Select a Landmark")
              }
            } label: {
              CategoryItem(landmark: landmark)
            }
          }
        }
      } // ScrollView
      .frame(height: 185)
    } // VStack
  }
}

#Preview {
  let categories = LandmarkViewModel().categories
  
  return CategoryRow(
    categoryName: categories.keys.first!,
    items: categories.first?.value ?? []
  )
  .environment(LandmarkViewModel())
}
