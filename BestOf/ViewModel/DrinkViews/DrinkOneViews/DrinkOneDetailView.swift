//
//  DrinkOneDetailView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/25/21.
//

import SwiftUI

struct DrinkOneDetailView: View {
  let drink: DrinkTest
  let city: City
  @ObservedObject var drinkOneVoteVM: DrinkOneVoteViewModel
  
  @State var showImagePicker: Bool = false
  @State var selectedUIImage: UIImage?
  @State var image: Image?
  
  init(drink: DrinkTest, city: City) {
    self.drink = drink
    self.city = city
    self.drinkOneVoteVM = DrinkOneVoteViewModel(drink: drink, city: city)
  }
  
  func loadImage() {
    guard let selectedImage = selectedUIImage else { return }
    image = Image(uiImage: selectedImage)
  }
  
  var body: some View {
    VStack(spacing: 20) {
      Button(action: {
        showImagePicker.toggle()
      }) {
        ZStack {
          if let image = image {
            image
              .resizable()
              .scaledToFill()
              .frame(width: 140, height: 140)
              .clipped()
              .cornerRadius(70)
          } else {
            Image("plus_photo")
              .resizable()
              .renderingMode(.template)
              .scaledToFill()
              .frame(width: 50, height: 50)
              .foregroundColor(.black)
          }
        }
      }
      .sheet(isPresented: $showImagePicker, onDismiss: loadImage, content: {
        ImagePicker(image: $selectedUIImage)
      })
      
//      Text("\(city.name) - \(city.drink[0])")
//        .font(.system(size: 25, weight: .bold))
//
      VStack {
        Text(drink.location)
          .font(.system(size: 25, weight: .semibold))
        Text(drink.address)
          .font(.system(size: 25, weight: .semibold))
        Text("Submitted by: \(drink.username)")
      }
      
      VStack {
        Text("\(drink.votes)")
          .font(.system(size: 25, weight: .semibold))
        Text("Votes")
          .font(.system(size: 25, weight: .semibold))
      }
      
      Button(action: {
        drinkOneVoteVM.didVote ? drinkOneVoteVM.unvoteDrink() : drinkOneVoteVM.voteDrink()
        drinkOneVoteVM.checkIfUserVotedDrink()
      }) {
        if drinkOneVoteVM.didVote {
          Text("Unvote")
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 200, height: 50)
            .background(Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)))
            .cornerRadius(25)
            .padding()
        } else {
          Text("Vote")
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 200, height: 50)
            .background(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
            .cornerRadius(25)
            .padding()
        }
      }
      
      Spacer()
    }
    .onAppear() {
      drinkOneVoteVM.checkIfUserVotedDrink()
    }
  }
}

//struct DrinkOneDetailView_Previews: PreviewProvider {
//  static var previews: some View {
//    DrinkOneDetailView(drink: drink)
//  }
//}
