//
//  AttractionOneView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct AttractionOneView: View {
  let city: City
  
  @ObservedObject var attractionVM: AttractionListViewModel
  @State private var showingAddAttractionOneView: Bool = false
  
  init(city: City) {
    self.city = city
    self.attractionVM = AttractionListViewModel(city: city)
  }
  
  private func attractionRowView(attraction: Attraction) -> some View {
    HStack {
      Image(city.attractionImage[0])
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
        .navigationBarTitle("Best \(city.attraction[0])")
        .navigationBarItems(trailing:
                              HStack {
                                Button(action: {
                                  self.showingAddAttractionOneView = true
                                }) {
                                  HStack {
                                    Text("Add \(city.attraction[0])")
                                      .foregroundColor(.black)
                                    Image(systemName: "plus")
                                      .foregroundColor(.black)
                                  }
                                }
                              }
        )
        .onAppear() {
          self.attractionVM.fetchAttractionOne()
        }
        .listStyle(PlainListStyle())
        .sheet(isPresented: $showingAddAttractionOneView) {
          AddAttractionOneView(city: city)
        }
      } //: LIST
    } //: NAV
  }
}

struct AttractionOneView_Previews: PreviewProvider {
  static var previews: some View {
    AttractionOneView(city: cities[0])
  }
}
