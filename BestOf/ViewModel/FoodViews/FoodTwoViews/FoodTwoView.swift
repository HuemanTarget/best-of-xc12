//
//  FoodTwoView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct FoodTwoView: View {
  let city: City
  
  @State private var showingAddFoodTwoView: Bool = false
  
  var body: some View {
    NavigationView {
      ZStack {
        VStack {
//          Text("Best \(city.drink[0]) in \(city.name)")
//            .font(.title2)
          
          List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            Text("Food \(item)")
          }
          .listStyle(PlainListStyle())
        }
        .navigationBarTitle("Best \(city.food[1])")
//        .navigationBarHidden(true)
        .navigationBarItems(trailing:
                              HStack {
                                Button(action: {
                                  self.showingAddFoodTwoView = true
                                }) {
                                  HStack {
                                    Text("Add \(city.food[1])")
                                      .foregroundColor(.black)
                                    //                                Image(systemName: "plus")
                                    //                                  .foregroundColor(.black)
                                  }
                                }
                              }
        )
      }
      .sheet(isPresented: $showingAddFoodTwoView) {
        AddFoodTwoView(city: city)
      }
    }
  }
}

struct FoodTwoView_Previews: PreviewProvider {
  static var previews: some View {
    FoodTwoView(city: cities[0])
  }
}
