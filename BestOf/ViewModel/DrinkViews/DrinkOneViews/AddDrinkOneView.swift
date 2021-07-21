//
//  AddDrinkOneView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct AddDrinkOneView: View {
  let city: City
  let db = Firestore.firestore()
  
  @ObservedObject var locationSearchService: LocationSearchService
  @Environment(\.presentationMode) var presentationMode
  
  @State private var name: String = ""
  @State private var address: String = ""
  
  @ObservedObject var uploadDrinkOneVM: UploadDrinkOneViewModel
  
  init(city: City) {
    self.city = city
    self.uploadDrinkOneVM = UploadDrinkOneViewModel(city: city)
    self.locationSearchService = LocationSearchService()
  }
  
  //  func save(location: String, address: String) {
  //
  //    do {
  //      let _ = try db.collection("\(city.name)").document(city.id).collection("\(city.drink[0])").addDocument(from: Drink(location: location, address: address))
  //    } catch let error {
  //      print(error)
  //    }
  //  }
  
  var body: some View {
    VStack {
      SearchBar(text: $locationSearchService.searchQuery)
      if locationSearchService.searchQuery.isEmpty {
        List {
          Text("No Search Blah")
        }
      } else {
        List(locationSearchService.completions) { completion in
          Button(action: {
            name = completion.title
            address = completion.subtitle
            
          }) {
            VStack(alignment: .leading) {
              Text(completion.title)
              Text(completion.subtitle)
                .font(.subheadline)
                .foregroundColor(.gray)
            }
          }
        }
    }
    
    VStack {
      Form {
        TextField("Location Name", text: $name)
          .textFieldStyle(PlainTextFieldStyle())
        TextField("Location Address", text: $address)
          .textFieldStyle(PlainTextFieldStyle())
        
        HStack {
          Spacer()
          
          Button(action: {
            //            save(location: name, address: address)
            uploadDrinkOneVM.uploadDrinkOne(location: name, address: address)
            presentationMode.wrappedValue.dismiss()
          }) {
            Text("Add New \(city.drink[0])")
          }
          
          Spacer()
        }
      }
    }
  }
}
}

//struct AddDrinkOneView_Previews: PreviewProvider {
//  static var previews: some View {
//    AddDrinkOneView(city: cities[0])
//  }
//}
