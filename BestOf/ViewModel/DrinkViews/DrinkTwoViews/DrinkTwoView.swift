//
//  DrinkTwoView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct DrinkTwoView: View {
  let city: City
  
  @ObservedObject var drinksVM: DrinksListViewModel
  @State private var showingAddDrinkTwoView: Bool = false
  
  init(city: City) {
    self.city = city
    self.drinksVM = DrinksListViewModel(city: city)
  }
  
  var body: some View {
    NavigationView {
      List {
        ForEach(drinksVM.drinks) { drink in
          HStack {
            Image(city.drinkImage[1])
              .resizable()
              .scaledToFill()
              .frame(width: 60, height: 60)
              .clipped()
              .cornerRadius(30)
            VStack(alignment: .leading) {
              Text(drink.location)
                .font(.headline)
              Text(drink.address)
                .font(.subheadline)
            }
            
            Spacer()
            
            VStack {
              Text("\(drink.votes)")
              Text("Votes")
            }
          }
        }//: LOOP
        .navigationBarTitle("Best \(city.drink[1])")
        .navigationBarItems(trailing:
                              HStack {
                                Button(action: {
                                  self.showingAddDrinkTwoView = true
                                }) {
                                  HStack {
                                    Text("Add \(city.drink[1])")
                                      .foregroundColor(.black)
                                    Image(systemName: "plus")
                                      .foregroundColor(.black)
                                  }
                                }
                              }
        )
        .onAppear() {
          self.drinksVM.fetchDrinksTwo()
        }
        .sheet(isPresented: $showingAddDrinkTwoView) {
          AddDrinkTwoView(city: city)
        }
      }//: LIST
    }//: NAV
  }
}


//struct DrinkTwoView_Previews: PreviewProvider {
//  static var previews: some View {
//    DrinkTwoView(city: cities[1])
//  }
//}
