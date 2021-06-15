//
//  CityFoodView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct CityFoodView: View {
  let city: City
  
  var body: some View {
    VStack{
      Text(city.name)
      Text("Food")
    }
  }
}

struct CityFoodView_Previews: PreviewProvider {
  static var previews: some View {
    CityFoodView(city: cities[0])
  }
}
