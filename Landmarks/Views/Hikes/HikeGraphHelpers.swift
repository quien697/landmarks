//
//  HikeGraphHelpers.swift
//  Landmarks
//
//  Created by Quien on 2025-10-25.
//

func rangeOfRanges<C: Collection>(_ ranges: C) -> Range<Double>
where C.Element == Range<Double> {
  guard !ranges.isEmpty else { return 0..<0 }
  
  let low = ranges.lazy.map { $0.lowerBound }.min()!
  let high = ranges.lazy.map { $0.upperBound }.max()!
  
  return low..<high
}

func magnitude(of range: Range<Double>) -> Double {
  range.upperBound - range.lowerBound
}
