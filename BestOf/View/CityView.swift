//
//  CityView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct CityView: View {
  var body: some View {
    NavigationView {
      List {
        ForEach(cities) { city in
          NavigationLink(destination: CityDetailView(city: city)) {
            CityListItemView(city: city)
          }
        }
      }
      .listStyle(PlainListStyle())
      .navigationTitle("Cities")
    }
  }
}

struct CityView_Previews: PreviewProvider {
  static var previews: some View {
    CityView()
  }
}
