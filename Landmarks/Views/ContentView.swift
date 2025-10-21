//
//  ContentView.swift
//  Landmarks
//
//  Created by Quien on 2025-10-21.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      MapView()
        .frame(height: 300)
      
      CircleImage()
        .offset(y: -130)
        .padding(.bottom, -130)
      
      VStack(alignment: .leading) {
        Text("Turtle Rock")
          .font(.title)
        
        HStack {
          Text("Joshua Tree National Park")
          
          Spacer()
          
          Text("California")
        } // HStack
        .font(.subheadline)
        .foregroundStyle(.secondary)
        
        Divider()
        
        Text("About Turtle Rock")
          .font(.title2)
        
        Text("Descriptive text goes here.")
      } // VStack
      .padding()
      
      Spacer()
    }
  }
}

#Preview {
  ContentView()
}
