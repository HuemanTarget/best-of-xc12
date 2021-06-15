//
//  CityDrinkView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct CityDrinkView: View {
  let city: City
  
  var body: some View {
    VStack {
      Text(city.name)
      Text("Drinks")
    }
  }
}

struct CityDrinkView_Previews: PreviewProvider {
  static var previews: some View {
    CityDrinkView(city: cities[0])
  }
}
