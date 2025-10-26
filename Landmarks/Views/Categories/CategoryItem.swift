//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Quien on 2025-10-22.
//

import SwiftUI

struct CategoryItem: View {
  let landmark: Landmark
  
  var body: some View {
    VStack(alignment: .leading) {
      landmark.image
        .renderingMode(.original)
        .resizable()
        .frame(width: 155, height: 155)
        .cornerRadius(5)
      
      Text(landmark.name)
        .foregroundStyle(.primary)
        .font(.caption)
    } // VStack
    .padding(.leading, 15)
  }
}

#Preview {
  CategoryItem(landmark: LandmarkViewModel().filteredLandmarks[0])
}
