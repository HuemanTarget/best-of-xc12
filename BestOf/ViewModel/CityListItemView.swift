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
    HStack(alignment: .center, spacing: 16) {
      Image(city.image)
        .resizable()
        .scaledToFit()
        .frame(width: 90, height: 90)
        .clipShape(RoundedRectangle(cornerRadius: 12))
      
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
    }
    .padding(.top, 10)
  }
}

struct CityListItemView_Previews: PreviewProvider {
  static var previews: some View {
    CityListItemView(city: cities[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
