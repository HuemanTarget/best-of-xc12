//
//  DrinkTwoView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct DrinkTwoView: View {
  let city: City
  
  @ObservedObject private var drinksVM = DrinksListViewModel()
  @State private var showingAddDrinkTwoView: Bool = false
  
  var body: some View {
    NavigationView {
      List {
        ForEach(drinksVM.drinks) { drink in
          VStack(alignment: .leading) {
            Text(drink.location)
            Text(drink.address)
            
            Divider()
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
          self.drinksVM.fetchNolaDrinksTwo()
        }
        .sheet(isPresented: $showingAddDrinkTwoView) {
          AddDrinkTwoView(city: city)
        }
      }//: LIST
    }//: NAV
  }
}


struct DrinkTwoView_Previews: PreviewProvider {
  static var previews: some View {
    DrinkTwoView(city: cities[1])
  }
}
