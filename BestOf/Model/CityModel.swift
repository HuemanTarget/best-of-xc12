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
  let image: String
  let drinkImage: [String]
  let drink: [String]
  let food: [String]
  let attraction: [String]
  let color: [String]
}
