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
  @Published var drinks = [DrinkTest]()
//  @Published var drink = [DrinkTest]()
  
  private var db = Firestore.firestore()
  
  init(city: City) {
    self.city = city
    fetchDrinksOne()
    fetchDrinksTwo()
    fetchDrinksThree()
    fetchDrinksFour()
  }
  
  func fetchDrinksOne() {
    let drinkOne = db.collection(city.name).document(city.id).collection(city.drink[0]).order(by: "votes", descending: true)
    
    drinkOne.addSnapshotListener { snapshot, error in
      guard let documents = snapshot?.documents else {
        print("No Documents")
        return
      }
      
      self.drinks = documents.compactMap({ queryDocumentSnapshot -> DrinkTest? in
        return try? queryDocumentSnapshot.data(as: DrinkTest.self)
      })
    }
  }
  
  func fetchDrinksTwo() {
    let drinkOne = db.collection(city.name).document(city.id).collection(city.drink[1]).order(by: "votes", descending: true)
    
    drinkOne.addSnapshotListener { snapshot, error in
      guard let documents = snapshot?.documents else {
        print("No Documents")
        return
      }
      
      self.drinks = documents.compactMap({ queryDocumentSnapshot -> DrinkTest? in
        return try? queryDocumentSnapshot.data(as: DrinkTest.self)
      })
    }
  }
  
  func fetchDrinksThree() {
    let drinkOne = db.collection(city.name).document(city.id).collection(city.drink[2]).order(by: "votes", descending: true)
    
    drinkOne.addSnapshotListener { snapshot, error in
      guard let documents = snapshot?.documents else {
        print("No Documents")
        return
      }
      
      self.drinks = documents.compactMap({ queryDocumentSnapshot -> DrinkTest? in
        return try? queryDocumentSnapshot.data(as: DrinkTest.self)
      })
    }
  }
  
  func fetchDrinksFour() {
    let drinkOne = db.collection(city.name).document(city.id).collection(city.drink[3]).order(by: "votes", descending: true)
    
    drinkOne.addSnapshotListener { snapshot, error in
      guard let documents = snapshot?.documents else {
        print("No Documents")
        return
      }
      
      self.drinks = documents.compactMap({ queryDocumentSnapshot -> DrinkTest? in
        return try? queryDocumentSnapshot.data(as: DrinkTest.self)
      })
    }
  }
}
