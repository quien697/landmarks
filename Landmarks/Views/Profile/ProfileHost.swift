//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Quien on 2025-10-22.
//

import SwiftUI

struct ProfileHost: View {
  @Environment(\.editMode) private var editMode
  @Environment(LandmarkViewModel.self) private var viewModel
  @State private var draftProfile: Profile = .default
  
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      HStack {
        if editMode?.wrappedValue == .active {
          Button("Cancel", role: .cancel) {
            draftProfile = viewModel.profile
            editMode?.animation().wrappedValue = .inactive
          }
        }
        
        Spacer()
        
        EditButton()
      } // HStack
      
      if editMode?.wrappedValue == .inactive {
        ProfileSummary(profile: viewModel.profile)
      } else {
        ProfileEditor(profile: $draftProfile)
          .onAppear {
            draftProfile = viewModel.profile
          }
          .onDisappear {
            viewModel.profile = draftProfile
          }
      }
    } // VStack
    .padding()
  }
}

#Preview {
  ProfileHost()
    .environment(LandmarkViewModel())
}
