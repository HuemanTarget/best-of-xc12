//
//  ContentView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var authVM: AuthViewModel
  
  var body: some View {
    Group {
      if authVM.userSession != nil {
        CityView()
      } else {
        LoginView()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
