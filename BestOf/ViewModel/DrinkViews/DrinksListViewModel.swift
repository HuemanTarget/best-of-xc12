//
//  DrinkViewModel.swift
//  BestOf
//
//  Created by Joshua Basche on 6/16/21.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class DrinksListViewModel: ObservableObject {
  @Published var drink: [DrinkViewModel] = []
  
  let db = Firestore.firestore()
  
  init() {
    let nolaDrinkOne = db.collection("New Orleans").document("nola").collection("Sazerac")
    
    nolaDrinkOne.getDocuments { (snapshot, error) in
      if let error = error {
        print(error.localizedDescription)
      } else {
        
        if let snapshot = snapshot {
          let drink: [DrinkViewModel] = snapshot.documents.compactMap { doc in
            var drink = try? doc.data(as: Drink.self)
            drink?.id = doc.documentID
            if let drink = drink {
              return DrinkViewModel(drink: drink)
            }
            return nil
          }
          
          DispatchQueue.main.async {
            self.drink = drink
          }
        }
      }
    }
  }
  
  
  func fetchNolaDrinksOne() {
//    let nolaDrinkOne = db.collection("New Orleans").document("nola").collection("Sazerac")
    
//    nolaDrinkOne.addSnapshotListener { (querySnapshot, error) in
//      guard let documents = querySnapshot?.documents else {
//        print("No Documents")
//        return
//      }
//
//      self.drinks = documents.map { (queryDocumentSnapshot) -> DrinkViewModel in
//        let data = queryDocumentSnapshot.data()
//
//        let location = data["location"] as? String ?? ""
//        let address = data["address"] as? String ?? ""
//
//        return DrinkViewModel(drink: drinks)
//      }
//    }
//    nolaDrinkOne.getDocuments { (snapshot, error) in
//      if let error = error {
//        print(error.localizedDescription)
//      } else {
//
//        if let snapshot = snapshot {
//          let drink: [DrinkViewModel] = snapshot.documents.compactMap { doc in
//            var drink = try? doc.data(as: Drink.self)
//            drink?.id = doc.documentID
//            if let drink = drink {
//              return DrinkViewModel(drink: drink)
//            }
//            return nil
//          }
//
//          DispatchQueue.main.async {
//            self.drink = drink
//          }
//        }
//      }
//    }
  }
  
}
