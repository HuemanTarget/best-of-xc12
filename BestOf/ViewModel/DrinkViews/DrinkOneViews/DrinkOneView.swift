//
//  DrinkOneView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct DrinkOneView: View {
  let city: City
  
  @ObservedObject var drinksVM: DrinksListViewModel
  @State private var showingAddDrinkOneView: Bool = false
  
  init(city: City) {
    self.city = city
    self.drinksVM = DrinksListViewModel(city: city)
  }
  
  private func drinkRowView(drink: DrinkTest) -> some View {
    VStack {
      HStack {
        Image(city.drinkImage[0])
          .resizable()
          .scaledToFill()
          .frame(width: 60, height: 60)
          .clipped()
          .cornerRadius(30)
        VStack(alignment: .leading) {
          Text(drink.location)
            .foregroundColor(.black)
            .font(.headline)
          Text(drink.address)
            .foregroundColor(.gray)
            .font(.subheadline)
        }
        
        Spacer()
        
        VStack {
          Text("\(drink.votes)")
            .foregroundColor(.black)
          Text("Votes")
            .foregroundColor(.black)
        }
      }
      
      Divider()
      
    }
    
  }
  
  var body: some View {
    NavigationView {
      ScrollView {
        VStack {
          ForEach(drinksVM.drinks) { drink in
            
            NavigationLink(destination: DrinkOneDetailView(drink: drink)) {
              drinkRowView(drink: drink)
            }
            
          }
          .navigationBarTitle("Best \(city.drink[0])")
          .navigationBarItems(trailing:
                                HStack {
                                  Button(action: {
                                    self.showingAddDrinkOneView = true
                                  }) {
                                    HStack {
                                      Text("Add \(city.drink[0])")
                                        .foregroundColor(.black)
                                      Image(systemName: "plus")
                                        .foregroundColor(.black)
                                    }
                                  }
                                }
          )
          .onAppear() {
            self.drinksVM.fetchDrinksOne()
          }
          .sheet(isPresented: $showingAddDrinkOneView) {
            AddDrinkOneView(city: city)
        }
        }
        .padding(.horizontal)
      } //: LIST
      .listStyle(PlainListStyle())
    } //: NAV
  }
}

//struct DrinkOneView_Previews: PreviewProvider {
//  static var previews: some View {
//    DrinkOneView(city: cities[0])
//  }
//}
