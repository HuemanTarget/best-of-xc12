//
//  CityDetailView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct CityDetailView: View {
  let city: City
  
  var body: some View {
    Text(city.name)
      .font(.headline)
  }
}

struct CityDetailView_Previews: PreviewProvider {
  static var previews: some View {
    CityDetailView(city: cities[0])
  }
}
