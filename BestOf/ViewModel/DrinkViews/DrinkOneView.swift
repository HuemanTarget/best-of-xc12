//
//  DrinkOneView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct DrinkOneView: View {
  let city: City
  
  @State private var showingAddDrinkOneView: Bool = false
  
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
        .navigationBarTitle("Best \(city.drink[0])")
//        .navigationBarHidden(true)
        .navigationBarItems(trailing:
                              HStack {
                                Button(action: {
                                  self.showingAddDrinkOneView = true
                                }) {
                                  HStack {
                                    Text("Add \(city.drink[0])")
                                      .foregroundColor(.black)
                                    //                                Image(systemName: "plus")
                                    //                                  .foregroundColor(.black)
                                  }
                                }
                              }
        )
      }
      .sheet(isPresented: $showingAddDrinkOneView) {
        AddDrinkOneView()
      }
    }
  }
}

struct DrinkOneView_Previews: PreviewProvider {
  static var previews: some View {
    DrinkOneView(city: cities[0])
  }
}
