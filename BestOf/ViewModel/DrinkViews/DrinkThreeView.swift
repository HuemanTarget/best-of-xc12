//
//  DrinkThreeView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct DrinkThreeView: View {
  let city: City
  
  @State private var showingAddDrinkThreeView: Bool = false
  
  var body: some View {
    NavigationView {
      ZStack {
        VStack {
//          Text("Best \(city.drink[0]) in \(city.name)")
//            .font(.title2)
          
          List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            Text("Drink \(item)")
          }
          .listStyle(PlainListStyle())
        }
        .navigationBarTitle("Best \(city.drink[2])")
//        .navigationBarHidden(true)
        .navigationBarItems(trailing:
                              HStack {
                                Button(action: {
                                  self.showingAddDrinkThreeView = true
                                }) {
                                  HStack {
                                    Text("Add \(city.drink[2])")
                                      .foregroundColor(.black)
                                    //                                Image(systemName: "plus")
                                    //                                  .foregroundColor(.black)
                                  }
                                }
                              }
        )
      }
      .sheet(isPresented: $showingAddDrinkThreeView) {
        AddDrinkThreeView()
      }
    }
  }
}

struct DrinkThreeView_Previews: PreviewProvider {
  static var previews: some View {
    DrinkThreeView(city: cities[0])
  }
}
