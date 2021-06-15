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
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
        .frame(width: 90, height: 90)
        .clipShape(RoundedRectangle(cornerRadius: 12))
      
      VStack (alignment: .leading, spacing: 5) {
        Text(city.name)
          .foregroundColor(Color(city.color[2]))
          .font(.title2)
          .fontWeight(.heavy)
          .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
          .multilineTextAlignment(.leading)

        
        Text(city.about)
          .foregroundColor(Color(city.color[2]))
          .font(.footnote)
          .multilineTextAlignment(.leading)
          .lineLimit(2)
          .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
          .padding(.trailing, 8)
      }
    }
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 25, style: .continuous)
        .fill(LinearGradient(gradient: Gradient(colors: [Color(city.color[0]), Color(city.color[1])]), startPoint: .leading, endPoint: .trailing))
        )
  }
}

struct CityListItemView_Previews: PreviewProvider {
  static var previews: some View {
    CityListItemView(city: cities[4])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
