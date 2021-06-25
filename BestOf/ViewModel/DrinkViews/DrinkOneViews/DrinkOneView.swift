//
//  DrinkOneView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct DrinkOneView: View {
  let city: City
  
  @ObservedObject var drinksVM: DrinksListViewModel
  @State private var showingAddDrinkOneView: Bool = false
  
  init(city: City) {
    self.city = city
    self.drinksVM = DrinksListViewModel(city: city)
  }
  
  var body: some View {
    NavigationView {
      List {
        ForEach(drinksVM.drinks) { drink in
          HStack {
            Image(city.drinkImage[0])
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
        }
        .navigationBarTitle("Best \(city.drink[0])")
        .navigationBarItems(trailing:
                              HStack {
                                Button(action: {
                                  self.showingAddDrinkOneView = true
                                }) {
                                  HStack {
                                    Text("Add \(city.drink[0])")
                                      .foregroundColor(.black)
                                    Image(systemName: "plus")
                                      .foregroundColor(.black)
                                  }
                                }
                              }
        )
        .onAppear() {
          self.drinksVM.fetchDrinksOne()
        }
        .sheet(isPresented: $showingAddDrinkOneView) {
          AddDrinkOneView(city: city)
        }
      } //: LIST
    } //: NAV
  }
}

//struct DrinkOneView_Previews: PreviewProvider {
//  static var previews: some View {
//    DrinkOneView(city: cities[0])
//  }
//}
