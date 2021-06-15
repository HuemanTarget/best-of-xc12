//
//  AttractionOneView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct AttractionOneView: View {
  let city: City
  
  @State private var showingAddAttractionOneView: Bool = false
  
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
        .navigationBarTitle("Best \(city.attraction[0])")
//        .navigationBarHidden(true)
        .navigationBarItems(trailing:
                              HStack {
                                Button(action: {
                                  self.showingAddAttractionOneView = true
                                }) {
                                  HStack {
                                    Text("Add \(city.attraction[0])")
                                      .foregroundColor(.black)
                                    //                                Image(systemName: "plus")
                                    //                                  .foregroundColor(.black)
                                  }
                                }
                              }
        )
      }
      .sheet(isPresented: $showingAddAttractionOneView) {
        AddAttractionOneView(city: city)
      }
    }
  }
}

struct AttractionOneView_Previews: PreviewProvider {
  static var previews: some View {
    AttractionOneView(city: cities[0])
  }
}
