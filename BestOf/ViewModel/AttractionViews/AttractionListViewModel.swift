//
//  AttractionListViewModel.swift
//  BestOf
//
//  Created by Joshua Basche on 6/25/21.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

class AttractionListViewModel: ObservableObject {
  let city: City
  @Published var attractions = [Attraction]()
  
  private var db = Firestore.firestore()
  
  init(city: City) {
    self.city = city
  }
  
  func fetchAttractionOne() {
    let attractionOne = db.collection(city.name).document(city.id).collection(city.attraction[0]).order(by: "votes", descending: true)
    
    attractionOne.addSnapshotListener { snapshot, error in
      guard let documents = snapshot?.documents else {
        print("No Documents")
        return
      }
      
      self.attractions = documents.compactMap({ queryDocumentSnapshot -> Attraction? in
        return try? queryDocumentSnapshot.data(as: Attraction.self)
      })
    }
  }
  
  func fetchAttractionTwo() {
    let attractionTwo = db.collection(city.name).document(city.id).collection(city.attraction[1]).order(by: "votes", descending: true)
    
    attractionTwo.addSnapshotListener { snapshot, error in
      guard let documents = snapshot?.documents else {
        print("No Documents")
        return
      }
      
      self.attractions = documents.compactMap({ queryDocumentSnapshot -> Attraction? in
        return try? queryDocumentSnapshot.data(as: Attraction.self)
      })
    }
  }
  
  func fetchAttractionThree() {
    let attractionThree = db.collection(city.name).document(city.id).collection(city.attraction[2]).order(by: "votes", descending: true)
    
    attractionThree.addSnapshotListener { snapshot, error in
      guard let documents = snapshot?.documents else {
        print("No Documents")
        return
      }
      
      self.attractions = documents.compactMap({ queryDocumentSnapshot -> Attraction? in
        return try? queryDocumentSnapshot.data(as: Attraction.self)
      })
    }
  }
  
  func fetchAttractionFour() {
    let attractionFour = db.collection(city.name).document(city.id).collection(city.attraction[3]).order(by: "votes", descending: true)
    
    attractionFour.addSnapshotListener { snapshot, error in
      guard let documents = snapshot?.documents else {
        print("No Documents")
        return
      }
      
      self.attractions = documents.compactMap({ queryDocumentSnapshot -> Attraction? in
        return try? queryDocumentSnapshot.data(as: Attraction.self)
      })
    }
  }
}
