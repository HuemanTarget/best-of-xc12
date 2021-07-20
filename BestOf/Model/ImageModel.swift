//
//  ImageModel.swift
//  BestOf
//
//  Created by Joshua Basche on 7/20/21.
//

import Foundation
import Firebase

struct Image: Identifiable {
  let id: String
  let imageUrl: String
  
  init(dictionary: [String: Any]) {
    self.id = dictionary["id"] as? String ?? ""
    self.imageUrl = dictionary["imageUrl"] as? String ?? ""
  }
}
