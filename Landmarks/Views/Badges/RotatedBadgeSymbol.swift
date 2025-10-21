//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by Quien on 2025-10-21.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
  let angle: Angle
  
  var body: some View {
    BadgeSymbol()
      .padding(-60)
      .rotationEffect(angle, anchor: .bottom)
  }
}

#Preview {
  RotatedBadgeSymbol(angle: Angle(degrees: 5))
}
