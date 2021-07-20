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
  let db = Firestore.firestore()
  
  init(city: City, drink: DrinkTest) {
    self.city = city
    self.drink = drink
  }
  
  func saveDrinkOneImage(image: UIImage) {
    guard let imageData = image.jpegData(compressionQuality: 0.3) else { return }
    let randomInt = Int32.random(in: 1...1000000)
//    let filename = NSUUID().uuidString
    let filename = "\(city.drink[0])\(randomInt)"
//    let storageRef = Storage.storage().reference().child(city.id).child(city.drink[0]).child(filename)
    let storageRef = Storage.storage().reference().child(filename)
    let drinkImagesRef = db.collection("\(city.name)").document(city.id).collection("\(city.drink[0])").document(drink.id).collection("drink-images").document()
    
    storageRef.putData(imageData, metadata: nil) { _, error in
      if let error = error {
        print("DEBUG: Failed to upload image \(error.localizedDescription)")
        return
      }
      
      storageRef.downloadURL { url, _ in
        guard let imageUrl = url?.absoluteString else { return }
        
        
        let data: [String: Any] = [
                  "id": drinkImagesRef.documentID,
                  "imageUrl": imageUrl,
                ]
        
        drinkImagesRef.setData(data) { _ in
          
        }
        
      }
    }
  }
}
