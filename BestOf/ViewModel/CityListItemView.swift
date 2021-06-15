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
    VStack (alignment: .leading, spacing: 5) {
      Text(city.name)
        .font(.title2)
        .fontWeight(.heavy)
        .multilineTextAlignment(.leading)

      
      Text(city.about)
        .font(.footnote)
        .multilineTextAlignment(.leading)
        .lineLimit(2)
        .padding(.trailing, 8)
    }
    .padding(.bottom, 10)
  }
}

struct CityListItemView_Previews: PreviewProvider {
  static var previews: some View {
    CityListItemView(city: cities[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
