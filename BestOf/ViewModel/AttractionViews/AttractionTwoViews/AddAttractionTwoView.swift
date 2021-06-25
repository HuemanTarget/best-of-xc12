//
//  AddAttractionTwoView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct AddAttractionTwoView: View {
  let city: City
  let db = Firestore.firestore()
  
  @Environment(\.presentationMode) var presentationMode
  
  @State private var name: String = ""
  @State private var address: String = ""
  
  func save(location: String, address: String) {
    do {
      let _ = try db.collection("\(city.name)").document(city.id).collection("\(city.attraction[1])").addDocument(from: Attraction(location: location, address: address))
    } catch let error {
      print(error)
    }
  }
  
  var body: some View {
    VStack {
      Form {
        TextField("Location Name", text: $name)
          .textFieldStyle(PlainTextFieldStyle())
        TextField("Location Address", text: $address)
          .textFieldStyle(PlainTextFieldStyle())
        
        HStack {
          Spacer()
          
          Button(action: {
            save(location: name, address: address)
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
