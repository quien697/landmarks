//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Quien on 2025-10-22.
//

import SwiftUI

struct CategoryHome: View {
  @Environment(LandmarkViewModel.self) var viewModel
  @State private var isShowProfile: Bool = false
  
  var body: some View {
    NavigationSplitView {
      List {
        PageView(pages: viewModel.features.map { FeatureCard(landmark: $0) })
          .listRowInsets(EdgeInsets())
        
        ForEach(viewModel.categories.keys.sorted(), id: \.self) { key in
          CategoryRow(categoryName: key, items: viewModel.categories[key]!)
        }
        .listRowInsets(EdgeInsets())
      } // List
      .listStyle(.inset)
      .navigationTitle("Featured")
      .toolbar {
        Button {
          isShowProfile.toggle()
        } label: {
          Label("User Profile", systemImage: "person.crop.circle")
        }
      }
      .sheet(isPresented: $isShowProfile) {
        ProfileHost()
          .environment(viewModel)
      }
    } detail: {
      Text("Select a Landmark")
    }
  }
}

#Preview {
  CategoryHome()
    .environment(LandmarkViewModel())
}
