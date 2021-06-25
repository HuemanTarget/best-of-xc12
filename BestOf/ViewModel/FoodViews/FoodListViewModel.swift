//
//  FoodListViewModel.swift
//  BestOf
//
//  Created by Joshua Basche on 6/25/21.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class FoodListViewModel: ObservableObject {
  let city: City
  @Published var foods = [Food]()
  
  private var db = Firestore.firestore()
  
  init(city: City) {
    self.city = city
  }
  
  func fetchFoodOne() {
    let foodOne = db.collection(city.name).document(city.id).collection(city.food[0])
    
    foodOne.addSnapshotListener { snapshot, error in
      guard let documents = snapshot?.documents else {
        print("No Documents")
        return
      }
      
      self.foods = documents.compactMap({ queryDocumentSnapshot -> Food? in
        return try? queryDocumentSnapshot.data(as: Food.self)
      })
    }
  }
  
  func fetchFoodTwo() {
    let foodTwo = db.collection(city.name).document(city.id).collection(city.food[1])
    
    foodTwo.addSnapshotListener { snapshot, error in
      guard let documents = snapshot?.documents else {
        print("No Documents")
        return
      }
      
      self.foods = documents.compactMap({ queryDocumentSnapshot -> Food? in
        return try? queryDocumentSnapshot.data(as: Food.self)
      })
    }
  }
  
  func fetchFoodThree() {
    let foodThree = db.collection(city.name).document(city.id).collection(city.food[2])
    
    foodThree.addSnapshotListener { snapshot, error in
      guard let documents = snapshot?.documents else {
        print("No Documents")
        return
      }
      
      self.foods = documents.compactMap({ queryDocumentSnapshot -> Food? in
        return try? queryDocumentSnapshot.data(as: Food.self)
      })
    }
  }
  
  func fetchFoodFour() {
    let foodFour = db.collection(city.name).document(city.id).collection(city.food[3])
    
    foodFour.addSnapshotListener { snapshot, error in
      guard let documents = snapshot?.documents else {
        print("No Documents")
        return
      }
      
      self.foods = documents.compactMap({ queryDocumentSnapshot -> Food? in
        return try? queryDocumentSnapshot.data(as: Food.self)
      })
    }
  }
}
