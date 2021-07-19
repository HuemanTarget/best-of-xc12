//
//  DrinkImageViewModel.swift
//  BestOf
//
//  Created by Joshua Basche on 7/19/21.
//

import SwiftUI
import Firebase

class DrinkImageViewModel: ObservableObject {
  let city: City
  let drink: DrinkTest
  
  init(city: City, drink: DrinkTest) {
    self.city = city
    self.drink = drink
  }
  
  func saveDrinkOneImage(image: UIImage) {
    guard let imageData = image.jpegData(compressionQuality: 0.3) else { return }
    
    let filename = NSUUID().uuidString
    let storageRef = Storage.storage().reference().child(city.id).child(city.drink[0]).child(filename)
    
    storageRef.putData(imageData, metadata: nil) { _, error in
      if let error = error {
        print("DEBUG: Failed to upload image \(error.localizedDescription)")
        return
      }
    }
  }
}
