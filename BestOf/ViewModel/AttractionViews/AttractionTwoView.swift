//
//  AttractionTwoView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct AttractionTwoView: View {
  let city: City
  
  @State private var showingAddAttractionTwoView: Bool = false
  
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
        .navigationBarTitle("Best \(city.attraction[1])")
//        .navigationBarHidden(true)
        .navigationBarItems(trailing:
                              HStack {
                                Button(action: {
                                  self.showingAddAttractionTwoView = true
                                }) {
                                  HStack {
                                    Text("Add \(city.attraction[1])")
                                      .foregroundColor(.black)
                                    //                                Image(systemName: "plus")
                                    //                                  .foregroundColor(.black)
                                  }
                                }
                              }
        )
      }
      .sheet(isPresented: $showingAddAttractionTwoView) {
        AddAttractionTwoView(city: city)
      }
    }
  }
}

struct AttractionTwoView_Previews: PreviewProvider {
  static var previews: some View {
    AttractionTwoView(city: cities[0])
  }
}
