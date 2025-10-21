//
//  CircleImage.swift
//  Landmarks
//
//  Created by Quien on 2025-10-21.
//

import SwiftUI

struct CircleImage: View {
  var body: some View {
    Image(.turtlerock)
      .clipShape(Circle())
      .overlay {
        Circle().stroke(.white, lineWidth: 4)
      }
      .shadow(radius: 7)
  }
}

#Preview {
  CircleImage()
}
