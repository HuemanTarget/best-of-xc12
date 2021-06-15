//
//  CityAttractionView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct CityAttractionView: View {
  let city: City
  
  var body: some View {
    VStack {
      Text(city.name)
      Text("Attractions")
    }
  }
}

struct CityAttractionView_Previews: PreviewProvider {
  static var previews: some View {
    CityAttractionView(city: cities[0])
  }
}
