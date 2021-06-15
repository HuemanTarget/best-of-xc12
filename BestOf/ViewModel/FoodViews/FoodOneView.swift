//
//  FoodOneView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct FoodOneView: View {
  let city: City
  
  @State private var showingAddFoodOneView: Bool = false
  
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
        .navigationBarTitle("Best \(city.food[0])")
//        .navigationBarHidden(true)
        .navigationBarItems(trailing:
                              HStack {
                                Button(action: {
                                  self.showingAddFoodOneView = true
                                }) {
                                  HStack {
                                    Text("Add \(city.food[0])")
                                      .foregroundColor(.black)
                                    //                                Image(systemName: "plus")
                                    //                                  .foregroundColor(.black)
                                  }
                                }
                              }
        )
      }
      .sheet(isPresented: $showingAddFoodOneView) {
        AddFoodOneView()
      }
    }
  }
}

struct FoodOneView_Previews: PreviewProvider {
  static var previews: some View {
    FoodOneView(city: cities[0])
  }
}
