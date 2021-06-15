//
//  CityTabView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct CityTabView: View {
  let city: City
  
  var body: some View {
    TabView {
      CityDrinkView(city: city)
        .tabItem {
          Label("Drinks", systemImage: "xmark")
        }
      
      CityFoodView(city: city)
        .tabItem {
          Label("Food", systemImage: "xmark")
        }
      
      CityAttractionView(city: city)
        .tabItem {
          Label("Attarctions", systemImage: "xmark")
        }
    }
  }
}

struct CityTabView_Previews: PreviewProvider {
  static var previews: some View {
    CityTabView(city: cities[0])
  }
}
