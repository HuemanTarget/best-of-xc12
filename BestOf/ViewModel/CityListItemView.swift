//
//  CityListItemView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct CityListItemView: View {
  let city: City
  
  var body: some View {
    VStack {
      Text(city.name)
        .font(.title2)
        .fontWeight(.heavy)
      
      Text(city.about)
        .font(.footnote)
        .multilineTextAlignment(.leading)
        .lineLimit(2)
        .padding(.trailing, 8)
    }
  }
}

struct CityListItemView_Previews: PreviewProvider {
  static let cities: [City] = Bundle.main.decode("City.json")
  
  static var previews: some View {
    CityListItemView(city: cities[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
