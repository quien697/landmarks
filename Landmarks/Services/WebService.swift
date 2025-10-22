//
//  WebService.swift
//  Landmarks
//
//  Created by Quien on 2025-10-22.
//

import Foundation

struct WebService {
  
  // MARK: - Load local JSON data from app bundle
  func loadLocalData<T: Decodable>(filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: "json") else {
      fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
      data = try Data(contentsOf: file)
    } catch {
      fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
      let decoder = JSONDecoder()
      return try decoder.decode(T.self, from: data)
    } catch {
      fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
  }
}
