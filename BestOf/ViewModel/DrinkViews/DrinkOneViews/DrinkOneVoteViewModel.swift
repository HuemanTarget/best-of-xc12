//
//  DrinkOneVoteViewModel.swift
//  BestOf
//
//  Created by Joshua Basche on 7/19/21.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

class DrinkOneVoteViewModel: ObservableObject {
  let drink: DrinkTest
  let city: City
  let db = Firestore.firestore()
  @Published var didVote = false
  
  init(drink: DrinkTest, city: City) {
    self.drink = drink
    self.city = city
    checkIfUserVotedDrink()
  }
  
  func voteDrink() {
    guard let uid = AuthViewModel.shared.userSession?.uid else { return }
    let drinkVotesRef = db.collection("\(city.name)").document(city.id).collection("\(city.drink[0])").document(drink.id).collection("drink-votes")
    let userVotesRef = db.collection("users").document(uid).collection("user-votes")
    
    db.collection("\(city.name)").document(city.id).collection("\(city.drink[0])").document(drink.id).updateData(["votes": drink.votes + 1]) { _ in
      drinkVotesRef.document(uid).setData([:]) { _ in
        userVotesRef.document(self.drink.id).setData([:]) { _ in
          self.didVote = true
        }
      }
    }
  }
  
  func unvoteDrink() {
    guard let uid = AuthViewModel.shared.userSession?.uid else { return }
    let drinkVotesRef = db.collection("\(city.name)").document(city.id).collection("\(city.drink[0])").document(drink.id).collection("drink-votes")
    let userVotesRef = db.collection("users").document(uid).collection("user-votes")
    
    db.collection("\(city.name)").document(city.id).collection("\(city.drink[0])").document(drink.id).updateData(["votes": drink.votes - 1]) { _ in
      drinkVotesRef.document(uid).delete { _ in
        userVotesRef.document(self.drink.id).delete { _ in
          self.didVote = false
        }
      }
    }
  }
  
  func checkIfUserVotedDrink() {
    guard let uid = AuthViewModel.shared.userSession?.uid else { return }
    let userVotesRef = db.collection("users").document(uid).collection("user-votes").document(drink.id)
    
    userVotesRef.getDocument { snapshot, _ in
      guard let didVote = snapshot?.exists else { return }
      self.didVote = didVote
    }
    
  }
}
