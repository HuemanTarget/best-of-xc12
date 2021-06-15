//
//  AttractionTwoView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct AttractionTwoView: View {
  let city: City
  
  var body: some View {
    Text("Best \(city.attraction[1]) in \(city.name)")
      .font(.title2)
  }
}

struct AttractionTwoView_Previews: PreviewProvider {
  static var previews: some View {
    AttractionTwoView(city: cities[0])
  }
}
