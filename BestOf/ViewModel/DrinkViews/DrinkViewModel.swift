//
//  DrinkViewModel.swift
//  BestOf
//
//  Created by Joshua Basche on 6/16/21.
//

import Foundation

struct DrinkViewModel {
  let drink: Drink
  
  var drinkId: String {
    drink.id ?? ""
  }
  
  var location: String {
    drink.location 
  }
  
  var address: String {
    drink.address
  }
}
