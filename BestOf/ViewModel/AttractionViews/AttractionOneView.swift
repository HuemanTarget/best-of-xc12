//
//  AttractionOneView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct AttractionOneView: View {
  let city: City
  
  var body: some View {
    Text("Best \(city.attraction[0]) in \(city.name)")
      .font(.title2)
  }
}

struct AttractionOneView_Previews: PreviewProvider {
  static var previews: some View {
    AttractionOneView(city: cities[0])
  }
}
