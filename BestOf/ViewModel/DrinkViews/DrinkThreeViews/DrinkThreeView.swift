//
//  DrinkThreeView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct DrinkThreeView: View {
  let city: City
  
  @ObservedObject var drinksVM: DrinksListViewModel
  @State private var showingAddDrinkThreeView: Bool = false
  
  init(city: City) {
    self.city = city
    self.drinksVM = DrinksListViewModel(city: city)
  }
  
  var body: some View {
    NavigationView {
      List {
        ForEach(drinksVM.drinks) { drink in
          VStack {
            HStack {
              Image(city.drinkImage[2])
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
            Divider()
          }
        }//: LOOP
        .navigationBarTitle("Best \(city.drink[2])")
        .navigationBarItems(trailing:
                              HStack {
                                Button(action: {
                                  self.showingAddDrinkThreeView = true
                                }) {
                                  HStack {
                                    Text("Add \(city.drink[2])")
                                      .foregroundColor(.black)
                                    Image(systemName: "plus")
                                      .foregroundColor(.black)
                                  }
                                }
                              }
        )
        .onAppear() {
          self.drinksVM.fetchDrinksThree()
        }
        .sheet(isPresented: $showingAddDrinkThreeView) {
          AddDrinkThreeView(city: city)
        }
      }//: LIST
    }//: NAV
  }
}

//struct DrinkThreeView_Previews: PreviewProvider {
//  static var previews: some View {
//    DrinkThreeView(city: cities[0])
//  }
//}
