//
//  CityView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI
import Kingfisher

struct CityView: View {
  @EnvironmentObject var authVM: AuthViewModel
  
  var body: some View {
    NavigationView {
      List {
        ForEach(cities) { city in
          NavigationLink(destination: CityTabView(city: city)) {
            CityListItemView(city: city)
          }
        }
      }.padding(.top, 20)
      .listStyle(PlainListStyle())
      .navigationBarItems(leading: Button(action: {
        authVM.signOut()
      }) {
        //        Image(systemName: "plus")
        if let user = authVM.user {
          KFImage(URL(string: user.profileImageUrl))
            .resizable()
            .scaledToFill()
            .clipped()
            .frame(width: 32, height: 32)
            .cornerRadius(16)
        }
      })
      .navigationBarTitle("Cities", displayMode: .inline)
    }
  }
}

struct CityView_Previews: PreviewProvider {
  static var previews: some View {
    CityView()
  }
}
