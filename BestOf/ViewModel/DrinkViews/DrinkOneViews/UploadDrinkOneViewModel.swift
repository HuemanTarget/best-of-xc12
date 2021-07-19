//
//  UploadDrinkOneViewModel.swift
//  BestOf
//
//  Created by Joshua Basche on 7/19/21.
//

import SwiftUI
import Firebase

class UploadDrinkOneViewModel: ObservableObject {
  let city: City
  let db = Firestore.firestore()
  
  init(city: City) {
    self.city = city
  }
  
  func uploadDrinkOne(location: String, address: String) {
    guard let user = AuthViewModel.shared.user else { return }
    let docRef = db.collection("\(city.name)").document(city.id).collection("\(city.drink[0])").document()
    
    let data: [String: Any] = ["uid": user.id,
                               "location": location,
                               "address": address,
                               "timestamp": Timestamp(date: Date()),
                               "username": user.username,
                               "votes": 0,
                               "id": docRef.documentID]
    
    docRef.setData(data) { _ in
      print("DEBUG: Uploaded tweet success!")
    }
    
  }
}
