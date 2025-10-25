//
//  HikeView.swift
//  Landmarks
//
//  Created by Quien on 2025-10-21.
//

import SwiftUI

extension AnyTransition {
  
  static var moveAndFade: AnyTransition {
    .asymmetric(
      insertion: .move(edge: .trailing).combined(with: .opacity),
      removal: .scale.combined(with: .opacity)
    )
  }
}

struct HikeView: View {
  @State private var isShowDetail: Bool = false
  let hike: Hike
  
  var body: some View {
    VStack {
      HStack {
        HikeGraph(hike: hike, path: \.elevation)
          .frame(width: 50, height: 30)
        
        VStack(alignment: .leading) {
          Text(hike.name)
            .font(.headline)
          Text(hike.distanceText)
        }
        
        Spacer()
        
        Button {
          withAnimation {
            isShowDetail.toggle()
          }
        } label: {
          Label("Graph", systemImage: "chevron.right.circle")
            .labelStyle(.iconOnly)
            .imageScale(.large)
            .rotationEffect(.degrees(isShowDetail ? 90 : 0))
            .scaleEffect(isShowDetail ? 1.5 : 1)
            .padding()
        }
      }
      
      if isShowDetail {
        HikeDetail(hike: hike)
          .transition(.moveAndFade)
      }
    }
  }
}

#Preview {
  VStack {
    HikeView(hike: LandmarkViewModel().hikes[0])
      .padding()
    
    Spacer()
  }
}
