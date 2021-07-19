//
//  AttractionTwoView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct AttractionTwoView: View {
  let city: City
  
  @ObservedObject var attractionVM: AttractionListViewModel
  @State private var showingAddAttractionTwoView: Bool = false
  
  init(city: City) {
    self.city = city
    self.attractionVM = AttractionListViewModel(city: city)
  }
  
  private func attractionRowView(attraction: Attraction) -> some View {
    VStack {
      HStack {
        Image(city.attractionImage[1])
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
      Divider()
    }
  }
  
  var body: some View {
    NavigationView {
      List {
        ForEach(attractionVM.attractions) { attraction in
          
            attractionRowView(attraction: attraction)
          
        }
        .navigationBarTitle("Best \(city.attraction[1])")
        .navigationBarItems(trailing:
                              HStack {
                                Button(action: {
                                  self.showingAddAttractionTwoView = true
                                }) {
                                  HStack {
                                    Text("Add \(city.attraction[1])")
                                      .foregroundColor(.black)
                                    Image(systemName: "plus")
                                      .foregroundColor(.black)
                                  }
                                }
                              }
        )
        .onAppear() {
          self.attractionVM.fetchAttractionTwo()
        }
        .listStyle(PlainListStyle())
        .sheet(isPresented: $showingAddAttractionTwoView) {
          AddAttractionTwoView(city: city)
        }
      } //: LIST
    } //: NAV
  }
}

struct AttractionTwoView_Previews: PreviewProvider {
  static var previews: some View {
    AttractionTwoView(city: cities[0])
  }
}
