//
//  CityAttractionView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct CityAttractionView: View {
  let city: City
  
  @State private var attractionSelection = 0
  
  var body: some View {
    VStack {
      VStack {
        Text("\(city.name) Attractions")
          .font(.title)
          .bold()
        
        Picker(selection: $attractionSelection, label: Text("Attractions")) {
//          ForEach(city.attraction, id: \.self) {
//            Text($0).tag(attractionSelection)
//          }
          Text(city.attraction[0]).tag(0)
          Text(city.attraction[1]).tag(1)
          Text(city.attraction[2]).tag(2)
          Text(city.attraction[3]).tag(3)
        }
        .pickerStyle(SegmentedPickerStyle())
      }
      Spacer()
    }
  }
}

struct CityAttractionView_Previews: PreviewProvider {
  static var previews: some View {
    CityAttractionView(city: cities[0])
  }
}
