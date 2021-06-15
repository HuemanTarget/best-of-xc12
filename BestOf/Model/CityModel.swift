//
//  CityModel.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct City: Codable, Identifiable {
  let id: String
  let name: String
  let about: String
  let drink: [String]
  let food: [String]
  let attraction: [String]
}