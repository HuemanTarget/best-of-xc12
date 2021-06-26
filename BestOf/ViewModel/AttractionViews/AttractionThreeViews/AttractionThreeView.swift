//
//  AttractionThreeView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct AttractionThreeView: View {
  let city: City
  
  @ObservedObject var attractionVM: AttractionListViewModel
  @State private var showingAddAttractionThreeView: Bool = false
  
  init(city: City) {
    self.city = city
    self.attractionVM = AttractionListViewModel(city: city)
  }
  
  private func attractionRowView(attraction: Attraction) -> some View {
    HStack {
      Image(city.attractionImage[2])
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
        .navigationBarTitle("Best \(city.attraction[2])")
        .navigationBarItems(trailing:
                              HStack {
                                Button(action: {
                                  self.showingAddAttractionThreeView = true
                                }) {
                                  HStack {
                                    Text("Add \(city.attraction[2])")
                                      .foregroundColor(.black)
                                    Image(systemName: "plus")
                                      .foregroundColor(.black)
                                  }
                                }
                              }
        )
        .onAppear() {
          self.attractionVM.fetchAttractionThree()
        }
        .listStyle(PlainListStyle())
        .sheet(isPresented: $showingAddAttractionThreeView) {
          AddAttractionThreeView(city: city)
        }
      } //: LIST
    } //: NAV
  }
}
