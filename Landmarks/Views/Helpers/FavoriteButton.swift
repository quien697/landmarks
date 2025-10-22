//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Quien on 2025-10-21.
//

import SwiftUI

struct FavoriteButton: View {
  let isSet: Bool
  let onToggle: () -> Void
  
  var body: some View {
    Button {
      onToggle()
    } label: {
      Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
        .labelStyle(.iconOnly)
        .foregroundStyle(isSet ? .yellow : .gray)
    }
  }
}

#Preview {
  FavoriteButton(
    isSet: true,
    onToggle: { print("Toggled") }
  )
}
