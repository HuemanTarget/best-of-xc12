//
//  AttractionFourView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct AttractionFourView: View {
  let city: City
  
  @ObservedObject var attractionVM: AttractionListViewModel
  @State private var showingAddAttractionFourView: Bool = false
  
  init(city: City) {
    self.city = city
    self.attractionVM = AttractionListViewModel(city: city)
  }
  
  private func attractionRowView(attraction: Attraction) -> some View {
    HStack {
      Image(city.attractionImage[3])
        .resizable()
        .scaledToFill()
        .frame(width: 60, height: 60)
        .clipped()
        .cornerRadius(30)
      VStack(alignment: .leading) {
        Text(attraction.location)
          .font(.headline)
        Text(attraction.address)
          .font(.subheadline)
      }
      
      Spacer()
      
      VStack {
        Text("\(attraction.votes)")
        Text("Votes")
      }
    }
  }
  
  var body: some View {
    NavigationView {
      List {
        ForEach(attractionVM.attractions) { attraction in
          
            attractionRowView(attraction: attraction)
          
        }
        .navigationBarTitle("Best \(city.attraction[3])")
        .navigationBarItems(trailing:
                              HStack {
                                Button(action: {
                                  self.showingAddAttractionFourView = true
                                }) {
                                  HStack {
                                    Text("Add \(city.attraction[3])")
                                      .foregroundColor(.black)
                                    Image(systemName: "plus")
                                      .foregroundColor(.black)
                                  }
                                }
                              }
        )
        .onAppear() {
          self.attractionVM.fetchAttractionFour()
        }
        .listStyle(PlainListStyle())
        .sheet(isPresented: $showingAddAttractionFourView) {
          AddAttractionFourView(city: city)
        }
      } //: LIST
    } //: NAV
  }
}

struct AttractionFourView_Previews: PreviewProvider {
  static var previews: some View {
    AttractionFourView(city: cities[0])
  }
}
