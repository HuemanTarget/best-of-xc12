//
//  FoodOneView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct FoodOneView: View {
  let city: City
  
  @ObservedObject var foodVM: FoodListViewModel
  @State private var showingAddFoodOneView: Bool = false
  
  init(city: City) {
    self.city = city
    self.foodVM = FoodListViewModel(city: city)
  }
  
  private func foodRowView(food: Food) -> some View {
    HStack {
      Image(city.drinkImage[0])
        .resizable()
        .scaledToFill()
        .frame(width: 60, height: 60)
        .clipped()
        .cornerRadius(30)
      VStack(alignment: .leading) {
        Text(food.location)
          .font(.headline)
        Text(food.address)
          .font(.subheadline)
      }
      
      Spacer()
      
      VStack {
        Text("\(food.votes)")
        Text("Votes")
      }
    }
  }
  
  var body: some View {
    NavigationView {
      List {
        ForEach(foodVM.foods) { food in
          
            foodRowView(food: food)
          
        }
        .navigationBarTitle("Best \(city.food[0])")
        .navigationBarItems(trailing:
                              HStack {
                                Button(action: {
                                  self.showingAddFoodOneView = true
                                }) {
                                  HStack {
                                    Text("Add \(city.food[0])")
                                      .foregroundColor(.black)
                                    Image(systemName: "plus")
                                      .foregroundColor(.black)
                                  }
                                }
                              }
        )
        .onAppear() {
          self.foodVM.fetchFoodOne()
        }
        .listStyle(PlainListStyle())
        .sheet(isPresented: $showingAddFoodOneView) {
          AddFoodOneView(city: city)
        }
      } //: LIST
    } //: NAV
  }
}

//struct FoodOneView_Previews: PreviewProvider {
//  static var previews: some View {
//    FoodOneView(city: cities[0])
//  }
//}
