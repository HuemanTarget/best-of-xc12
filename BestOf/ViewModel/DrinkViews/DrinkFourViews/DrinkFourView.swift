//
//  DrinkFourView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct DrinkFourView: View {
  let city: City
  
  @ObservedObject var drinksVM: DrinksListViewModel
  @State private var showingAddDrinkFourView: Bool = false
  
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
              Image(city.drinkImage[3])
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
        .navigationBarTitle("Best \(city.drink[3])")
        .navigationBarItems(trailing:
                              HStack {
                                Button(action: {
                                  self.showingAddDrinkFourView = true
                                }) {
                                  HStack {
                                    Text("Add \(city.drink[3])")
                                      .foregroundColor(.black)
                                    Image(systemName: "plus")
                                      .foregroundColor(.black)
                                  }
                                }
                              }
        )
        .onAppear() {
          self.drinksVM.fetchDrinksFour()
        }
        .sheet(isPresented: $showingAddDrinkFourView) {
          AddDrinkFourView(city: city)
        }
      }//: LIST
    }//: NAV
  }
}
