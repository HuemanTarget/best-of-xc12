//
//  AddAttractionTwoView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct AddAttractionTwoView: View {
  let city: City
  @Environment(\.presentationMode) var presentationMode
  
  @State private var name: String = ""
  @State private var address: String = ""
  
  var body: some View {
    VStack {
      Form {
        TextField("Location Name", text: $name)
          .textFieldStyle(PlainTextFieldStyle())
        TextField("Location Name", text: $address)
          .textFieldStyle(PlainTextFieldStyle())
        
        HStack {
          Spacer()
          
          Button(action: {
            presentationMode.wrappedValue.dismiss()
          }) {
            Text("Add New \(city.attraction[1])")
          }
          
          Spacer()
        }
      }
    }
  }
}

struct AddAttractionTwoView_Previews: PreviewProvider {
  static var previews: some View {
    AddAttractionTwoView(city: cities[0])
  }
}
