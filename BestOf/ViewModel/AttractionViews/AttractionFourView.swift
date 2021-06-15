//
//  AttractionFourView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct AttractionFourView: View {
  let city: City
  
  var body: some View {
    Text("Best \(city.attraction[3]) in \(city.name)")
      .font(.title2)
  }
}

struct AttractionFourView_Previews: PreviewProvider {
  static var previews: some View {
    AttractionFourView(city: cities[0])
  }
}
