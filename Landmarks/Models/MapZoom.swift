//
//  MapZoom.swift
//  Landmarks
//
//  Created by Quien on 2025-10-25.
//

import Foundation
import CoreLocation

enum MapZoom: String, CaseIterable, Identifiable {
  case near = "Near"
  case medium = "Medium"
  case far = "Far"
  
  var id: MapZoom { self }
  
  var delta: CLLocationDegrees {
    switch self {
    case .near: return 0.02
    case .medium: return 0.2
    case .far: return 2
    }
  }
}
