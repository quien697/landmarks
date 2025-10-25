//
//  MapView.swift
//  Landmarks
//
//  Created by Quien on 2025-10-21.
//

import SwiftUI
import MapKit

struct MapView: View {
  @AppStorage("MapView.zoom") private var zoom: MapZoom = .medium
  let coordinate: CLLocationCoordinate2D
  
  var body: some View {
    Map(position: .constant(.region(region)))
  }
  
  private var region: MKCoordinateRegion {
    MKCoordinateRegion(
      center: coordinate,
      span: MKCoordinateSpan(
        latitudeDelta: zoom.delta,
        longitudeDelta: zoom.delta
      )
    )
  }
}

#Preview {
  MapView(coordinate: CLLocationCoordinate2D(
    latitude: 34.011_286, longitude: -116.166_868)
  )
}
