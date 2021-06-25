//
//  DrinkOneDetailView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/25/21.
//

import SwiftUI

struct DrinkOneDetailView: View {
  
  let drink: Drink
  
  var body: some View {
    VStack(spacing: 20) {
      Image(systemName: "plus.circle")
        .resizable()
        .scaledToFill()
        .frame(width: 200, height: 200)
        .clipShape(Circle())
      
//      Text("\(city.name) - \(city.drink[0])")
//        .font(.system(size: 25, weight: .bold))
//
      VStack {
        Text(drink.location)
          .font(.system(size: 25, weight: .semibold))
        Text(drink.address)
          .font(.system(size: 25, weight: .semibold))
      }
      
      VStack {
        Text("\(drink.votes)")
          .font(.system(size: 25, weight: .semibold))
        Text("Votes")
          .font(.system(size: 25, weight: .semibold))
      }
      
      Spacer()
    }
    .padding(.top, 10)
  }
}

struct DrinkOneDetailView_Previews: PreviewProvider {
  static var previews: some View {
    DrinkOneDetailView(drink: Drink(location: "Awesome Bar", address: "123 Anywhere Street", votes: 0))
  }
}
