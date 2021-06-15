//
//  FoodThreeView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct FoodThreeView: View {
  let city: City
  
  @State private var showingAddFoodThreeView: Bool = false
  
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
        .navigationBarTitle("Best \(city.food[2])")
//        .navigationBarHidden(true)
        .navigationBarItems(trailing:
                              HStack {
                                Button(action: {
                                  self.showingAddFoodThreeView = true
                                }) {
                                  HStack {
                                    Text("Add \(city.food[2])")
                                      .foregroundColor(.black)
                                    //                                Image(systemName: "plus")
                                    //                                  .foregroundColor(.black)
                                  }
                                }
                              }
        )
      }
      .sheet(isPresented: $showingAddFoodThreeView) {
        AddFoodThreeView()
      }
    }
  }
}

struct FoodThreeView_Previews: PreviewProvider {
  static var previews: some View {
    FoodThreeView(city: cities[0])
  }
}
