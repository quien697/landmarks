//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Quien on 2025-10-21.
//

import SwiftUI

struct FavoriteButton: View {
  @Binding var isSet: Bool
  
  var body: some View {
    Button {
      isSet.toggle()
    } label: {
      Label(
        "Toggle Favorite",
        systemImage: isSet ? "star.fill" : "star"
      )
      .labelStyle(.iconOnly)
      .foregroundStyle(isSet ? .yellow : .gray)
    }
  }
}

#Preview {
  FavoriteButton(isSet: .constant(true))
}
