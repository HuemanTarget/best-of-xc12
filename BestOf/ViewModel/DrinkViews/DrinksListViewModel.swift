//
//  DrinkListViewModel.swift
//  BestOf
//
//  Created by Joshua Basche on 6/16/21.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class DrinksListViewModel: ObservableObject {
  let city: City
  @Published var drinks = [Drink]()
  
  private var db = Firestore.firestore()
  
  init(city: City) {
    self.city = city
  }
  
  func fetchDrinksOne() {
    let drinkOne = db.collection(city.name).document(city.id).collection(city.drink[0])
    
    drinkOne.addSnapshotListener { snapshot, error in
      guard let documents = snapshot?.documents else {
        print("No Documents")
        return
      }
      
      self.drinks = documents.compactMap({ queryDocumentSnapshot -> Drink? in
        return try? queryDocumentSnapshot.data(as: Drink.self)
      })
    }
  }
  
  func fetchDrinksTwo() {
    let drinkOne = db.collection(city.name).document(city.id).collection(city.drink[1])
    
    drinkOne.addSnapshotListener { snapshot, error in
      guard let documents = snapshot?.documents else {
        print("No Documents")
        return
      }
      
      self.drinks = documents.compactMap({ queryDocumentSnapshot -> Drink? in
        return try? queryDocumentSnapshot.data(as: Drink.self)
      })
    }
  }
  
  func fetchDrinksThree() {
    let drinkOne = db.collection(city.name).document(city.id).collection(city.drink[2])
    
    drinkOne.addSnapshotListener { snapshot, error in
      guard let documents = snapshot?.documents else {
        print("No Documents")
        return
      }
      
      self.drinks = documents.compactMap({ queryDocumentSnapshot -> Drink? in
        return try? queryDocumentSnapshot.data(as: Drink.self)
      })
    }
  }
  
  func fetchDrinksFour() {
    let drinkOne = db.collection(city.name).document(city.id).collection(city.drink[3])
    
    drinkOne.addSnapshotListener { snapshot, error in
      guard let documents = snapshot?.documents else {
        print("No Documents")
        return
      }
      
      self.drinks = documents.compactMap({ queryDocumentSnapshot -> Drink? in
        return try? queryDocumentSnapshot.data(as: Drink.self)
      })
    }
  }
  
  
//  func fetchNolaDrinksOne() {
//    let nolaDrinkOne = db.collection("New Orleans").document("nola").collection("Sazerac")
//
//    nolaDrinkOne.addSnapshotListener { snapshot, error in
//      guard let documents = snapshot?.documents else {
//        print("No Documents")
//        return
//      }
//
//      self.drinks = documents.compactMap({ queryDocumentSnapshot -> Drink? in
//        return try? queryDocumentSnapshot.data(as: Drink.self)
//      })
//    }
//  }
//
//  func fetchNolaDrinksTwo() {
//    let nolaDrinkTwo = db.collection("New Orleans").document("nola").collection("Hurricane")
//
//    nolaDrinkTwo.addSnapshotListener { snapshot, error in
//      guard let documents = snapshot?.documents else {
//        print("No Documents")
//        return
//      }
//
//      self.drinks = documents.compactMap({ queryDocumentSnapshot -> Drink? in
//        return try? queryDocumentSnapshot.data(as: Drink.self)
//      })
//    }
//  }
//
//  func fetchNolaDrinksThree() {
//    let nolaDrinkThree = db.collection("New Orleans").document("nola").collection("Pimms Cup")
//
//    nolaDrinkThree.addSnapshotListener { snapshot, error in
//      guard let documents = snapshot?.documents else {
//        print("No Documents")
//        return
//      }
//
//      self.drinks = documents.compactMap({ queryDocumentSnapshot -> Drink? in
//        return try? queryDocumentSnapshot.data(as: Drink.self)
//      })
//    }
//  }
//
//  func fetchNolaDrinksFour() {
//    let nolaDrinkFour = db.collection("New Orleans").document("nola").collection("Dive Bar")
//
//    nolaDrinkFour.addSnapshotListener { snapshot, error in
//      guard let documents = snapshot?.documents else {
//        print("No Documents")
//        return
//      }
//
//      self.drinks = documents.compactMap({ queryDocumentSnapshot -> Drink? in
//        return try? queryDocumentSnapshot.data(as: Drink.self)
//      })
//    }
//  }
//
//  func fetchLADrinksOne() {
//    let laDrinkOne = db.collection("Los Angeles").document("la").collection("Moscow Mule")
//
//    laDrinkOne.addSnapshotListener { snapshot, error in
//      guard let documents = snapshot?.documents else {
//        print("No Documents")
//        return
//      }
//
//      self.drinks = documents.compactMap({ queryDocumentSnapshot -> Drink? in
//        return try? queryDocumentSnapshot.data(as: Drink.self)
//      })
//    }
//  }
}
