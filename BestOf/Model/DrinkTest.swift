//
//  DrinkTest.swift
//  BestOf
//
//  Created by Joshua Basche on 7/19/21.
//

import Firebase
import SwiftUI

struct DrinkTest: Identifiable, Decodable {
  let id: String
  let username: String
  let address: String
  let location: String
  let votes: Int
  let uid: String
  let timestamp: Timestamp
  
  init(dictionary: [String: Any]) {
    self.id = dictionary["id"] as? String ?? ""
    self.username = dictionary["username"] as? String ?? ""
    self.address = dictionary["address"] as? String ?? ""
    self.location = dictionary["location"] as? String ?? ""
    self.votes = dictionary["votes"] as? Int ?? 0
    self.uid = dictionary["uid"] as? String ?? ""
    self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
  }
}
