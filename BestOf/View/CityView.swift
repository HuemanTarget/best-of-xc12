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
      VStack {
        ForEach(cities) { city in
          CityListItemView(city: city)
        }
      }
    }
  }
}

struct CityView_Previews: PreviewProvider {
  static var previews: some View {
    CityView()
  }
}
