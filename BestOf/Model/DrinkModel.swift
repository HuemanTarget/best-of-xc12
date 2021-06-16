//
//  DrinkModel.swift
//  BestOf
//
//  Created by Joshua Basche on 6/16/21.
//

import Foundation

struct Drink: Codable, Identifiable {
  var id: String?
  var location: String = ""
  var address: String = ""
}
