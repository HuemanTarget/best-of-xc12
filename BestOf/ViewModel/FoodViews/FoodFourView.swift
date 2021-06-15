//
//  FoodFourView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct FoodFourView: View {
  let city: City
  
  @State private var showingAddFoodFourView: Bool = false
  
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
        .navigationBarTitle("Best \(city.food[3])")
//        .navigationBarHidden(true)
        .navigationBarItems(trailing:
                              HStack {
                                Button(action: {
                                  self.showingAddFoodFourView = true
                                }) {
                                  HStack {
                                    Text("Add \(city.food[3])")
                                      .foregroundColor(.black)
                                    //                                Image(systemName: "plus")
                                    //                                  .foregroundColor(.black)
                                  }
                                }
                              }
        )
      }
      .sheet(isPresented: $showingAddFoodFourView) {
        AddFoodFourView()
      }
    }
  }
}

struct FoodFourView_Previews: PreviewProvider {
  static var previews: some View {
    FoodFourView(city: cities[0])
  }
}
