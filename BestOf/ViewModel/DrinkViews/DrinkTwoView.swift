//
//  DrinkTwoView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct DrinkTwoView: View {
  let city: City
  
  @State private var showingAddDrinkTwoView: Bool = false
  
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
        .navigationBarTitle("Best \(city.drink[1])")
//        .navigationBarHidden(true)
        .navigationBarItems(trailing:
                              HStack {
                                Button(action: {
                                  self.showingAddDrinkTwoView = true
                                }) {
                                  HStack {
                                    Text("Add \(city.drink[1])")
                                      .foregroundColor(.black)
                                    //                                Image(systemName: "plus")
                                    //                                  .foregroundColor(.black)
                                  }
                                }
                              }
        )
      }
      .sheet(isPresented: $showingAddDrinkTwoView) {
        AddDrinkTwoView()
      }
    }
  }
}


struct DrinkTwoView_Previews: PreviewProvider {
  static var previews: some View {
    DrinkTwoView(city: cities[0])
  }
}
