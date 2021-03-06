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
  @Published var photos = [Photo]()
  let db = Firestore.firestore()
  
  init(city: City, drink: DrinkTest) {
    self.city = city
    self.drink = drink
    fetchDrinkOneImages()
  }
  
  func fetchDrinkOneImages() {
    let drinkOneImage = db.collection(city.name).document(city.id).collection(city.drink[0]).document(drink.id).collection("drink-images").order(by: "timestamp", descending: true)
    
    //    drinkOneImage.getDocuments { (snapshot, error) in
    //      guard let snapshot = snapshot, error == nil else {
    ////        handle error
    //        return
    //      }
    //
    //      print("Number of documents: \(snapshot.documents.count)")
    //
    //      self.photos = snapshot.documents.compactMap({ documentSnapshot -> Photo? in
    //        let documentData = documentSnapshot.data()
    //        if let url = documentData["imageUrl"] as? String {
    //          return Photo(dictionary: [
    //            "imageUrl": url
    //          ])
    //        } else {
    //          return nil
    //        }
    //      })
    //
    //    }
    drinkOneImage.addSnapshotListener { snapshot, error in
      guard let documents = snapshot?.documents else {
        print("No Documents")
        return
      }
      
      
      self.photos = documents.compactMap({ queryDocumentSnapshot -> Photo? in
        return try? queryDocumentSnapshot.data(as: Photo.self)
      })
    }
  }
  
  func saveDrinkOneImage(image: UIImage) {
    guard let imageData = image.jpegData(compressionQuality: 0.3) else { return }
    let randomInt = Int32.random(in: 1...1000000)
    //    let filename = NSUUID().uuidString
    let filename = "\(city.drink[0])\(randomInt)"
    //    let storageRef = Storage.storage().reference().child(city.id).child(city.drink[0]).child(filename)
    let storageRef = Storage.storage().reference().child(filename)
    let drinkImagesRef = db.collection("\(city.name)").document(city.id).collection("\(city.drink[0])").document(drink.id).collection("drink-images")
//    let drinkImagesRefDoc = db.collection("\(city.name)").document(city.id).collection("\(city.drink[0])").document(drink.id).collection("drink-images").document()
    
    storageRef.putData(imageData, metadata: nil) { _, error in
      if let error = error {
        print("DEBUG: Failed to upload image \(error.localizedDescription)")
        return
      }
      
      storageRef.downloadURL { url, _ in
        guard let imageUrl = url?.absoluteString else { return }
//        let newDocumentID = UUID().uuidString
//
//        let data: [String: Any] = [
//          "id": newDocumentID,
//          "timestamp": Timestamp(date: Date()),
//          "imageUrl": imageUrl,
//        ]
        
        //        drinkImagesRef.setData(data) { _ in
        //          self.fetchDrinkOneImages()
        //        }
        do {
          let _  = try drinkImagesRef.addDocument(from: Photo(id: UUID().uuidString, imageUrl: imageUrl, timestamp: Timestamp(date: Date()))) { _ in
            self.fetchDrinkOneImages()
          }
        } catch {
          print(error)
        }
        
        
      }
    }
  }
}
