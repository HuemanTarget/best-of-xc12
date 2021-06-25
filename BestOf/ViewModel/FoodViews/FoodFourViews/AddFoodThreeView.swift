//
//  AddFoodThreeView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct AddFoodThreeView: View {
  let city: City
  
  @ObservedObject var foodVM: FoodListViewModel
  @State private var showingAddFoodFourView: Bool = false
  
  init(city: City) {
    self.city = city
    self.foodVM = FoodListViewModel(city: city)
  }
  
  private func foodRowView(food: Food) -> some View {
    HStack {
      Image(city.drinkImage[3])
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
        .navigationBarTitle("Best \(city.food[3])")
        .navigationBarItems(trailing:
                              HStack {
                                Button(action: {
                                  self.showingAddFoodFourView = true
                                }) {
                                  HStack {
                                    Text("Add \(city.food[3])")
                                      .foregroundColor(.black)
                                    Image(systemName: "plus")
                                      .foregroundColor(.black)
                                  }
                                }
                              }
        )
        .onAppear() {
          self.foodVM.fetchFoodFour()
        }
        .listStyle(PlainListStyle())
        .sheet(isPresented: $showingAddFoodFourView) {
          AddFoodFourView(city: city)
        }
      } //: LIST
    } //: NAV
  }
}

struct AddFoodThreeView_Previews: PreviewProvider {
  static var previews: some View {
    AddFoodThreeView(city: cities[0])
  }
}
