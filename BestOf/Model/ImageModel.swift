//
//  ImageModel.swift
//  BestOf
//
//  Created by Joshua Basche on 7/20/21.
//

import Foundation
import Firebase

struct Photo: Identifiable, Decodable {
  let id: String
  let imageUrl: String
  let timestamp: Timestamp
  
  init(dictionary: [String: Any]) {
    self.id = dictionary["id"] as? String ?? ""
    self.imageUrl = dictionary["imageUrl"] as? String ?? ""
    self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
  }
}
