//
//  AttractionFourView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct AttractionFourView: View {
  let city: City
  
  @State private var showingAddAttractionFourView: Bool = false
  
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
        .navigationBarTitle("Best \(city.attraction[3])")
//        .navigationBarHidden(true)
        .navigationBarItems(trailing:
                              HStack {
                                Button(action: {
                                  self.showingAddAttractionFourView = true
                                }) {
                                  HStack {
                                    Text("Add \(city.attraction[3])")
                                      .foregroundColor(.black)
                                    //                                Image(systemName: "plus")
                                    //                                  .foregroundColor(.black)
                                  }
                                }
                              }
        )
      }
      .sheet(isPresented: $showingAddAttractionFourView) {
        AddAttractionFourView(city: city)
      }
    }
  }
}

struct AttractionFourView_Previews: PreviewProvider {
  static var previews: some View {
    AttractionFourView(city: cities[0])
  }
}
