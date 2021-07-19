//
//  DrinkOneDetailView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/25/21.
//

import SwiftUI

struct DrinkOneDetailView: View {
  
  let drink: DrinkTest
  
  var body: some View {
    VStack(spacing: 20) {
      Image(systemName: "plus.circle")
        .resizable()
        .scaledToFill()
        .frame(width: 100, height: 100)
        .clipShape(Circle())
      
//      Text("\(city.name) - \(city.drink[0])")
//        .font(.system(size: 25, weight: .bold))
//
      VStack {
        Text(drink.location)
          .font(.system(size: 25, weight: .semibold))
        Text(drink.address)
          .font(.system(size: 25, weight: .semibold))
        Text("Submitted by: \(drink.username)")
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

//struct DrinkOneDetailView_Previews: PreviewProvider {
//  static var previews: some View {
//    DrinkOneDetailView(drink: drink)
//  }
//}
