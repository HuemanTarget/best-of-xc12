//
//  AttractionThreeView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct AttractionThreeView: View {
  let city: City
  
  var body: some View {
    Text("Best \(city.attraction[2]) in \(city.name)")
      .font(.title2)
  }
}

struct AttractionThreeView_Previews: PreviewProvider {
  static var previews: some View {
    AttractionThreeView(city: cities[0])
  }
}
