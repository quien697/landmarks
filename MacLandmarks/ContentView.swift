//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Quien on 2025-10-24.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    LandmarkList()
      .frame(minWidth: 700, minHeight: 300)
  }
}

#Preview {
  ContentView()
    .environment(LandmarkViewModel())
}
