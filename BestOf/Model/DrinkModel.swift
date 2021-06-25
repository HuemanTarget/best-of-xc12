//
//  DrinkModel.swift
//  BestOf
//
//  Created by Joshua Basche on 6/16/21.
//

import Foundation
import FirebaseFirestoreSwift

struct Drink: Codable, Identifiable {
  @DocumentID var id: String?
  var location: String = ""
  var address: String = ""
  var votes: Int = 0
  
  enum CodingKeys: String, CodingKey {
    case id
    case location
    case address
    case votes
  }
}
