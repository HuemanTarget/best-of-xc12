//
//  RegistrationView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/26/21.
//

import SwiftUI

struct RegistrationView: View {
  @Environment(\.presentationMode) var presentationMode
  @EnvironmentObject var authVM: AuthViewModel
  
  @State var email: String = ""
  @State var password: String = ""
  @State var username: String = ""
  @State var fullname: String = ""
//  @State var showImagePicker: Bool = false
//  @State var selectedUIImage: UIImage?
//  @State var image: Image?
  
//  func loadImage() {
//    guard let selectedImage = selectedUIImage else { return }
//    image = Image(uiImage: selectedImage)
//  }
  
  var body: some View {
    ZStack {
      VStack {
        Button(action: {
//          showImagePicker.toggle()
        }) {
          ZStack {
//            if let image = image {
//              image
//                .resizable()
//                .scaledToFill()
//                .frame(width: 140, height: 140)
//                .clipped()
//                .cornerRadius(70)
//                .padding(.top, 88)
//                .padding(.bottom, 16)
//            } else {
//              Image("plus_photo")
//                .resizable()
//                .renderingMode(.template)
//                .scaledToFill()
//                .frame(width: 140, height: 140)
//                .padding(.top, 88)
//                .padding(.bottom, 16)
//                .foregroundColor(.white)
//            }
          }
        }
//        .sheet(isPresented: $showImagePicker, onDismiss: loadImage, content: {
//          ImagePicker(image: $selectedUIImage)
//        })
        
        VStack(spacing: 20) {
          CustomTextField(text: $fullname, placeholder: Text("Full Name"), imageName: "person")
            .padding()
            .background(Color(.init(white: 1, alpha: 0.15)))
            .cornerRadius(10)
            .foregroundColor(.white)
          
          CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
            .padding()
            .background(Color(.init(white: 1, alpha: 0.15)))
            .cornerRadius(10)
            .foregroundColor(.white)
          
          CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person")
            .padding()
            .background(Color(.init(white: 1, alpha: 0.15)))
            .cornerRadius(10)
            .foregroundColor(.white)
          
          CustomSecureField(text: $password, placeholder: Text("Password"))
            .padding()
            .background(Color(.init(white: 1, alpha: 0.15)))
            .cornerRadius(10)
            .foregroundColor(.white)
        }
        .padding(.horizontal, 32)
        
        Button(action: {
//          guard let image = selectedUIImage else { return }
//
//          authVM.registerUser(email: email, password: password, username: username, fullname: fullname, profileImage: image)
          
//          presentationMode.wrappedValue.dismiss()
        }) {
          Text("Sign Up")
            .font(.headline)
            .foregroundColor(Color(#colorLiteral(red: 0.1170291379, green: 0.6328371167, blue: 0.951066196, alpha: 1)))
            .frame(width: 360, height: 50)
            .background(Color.white)
            .cornerRadius(25)
            .padding()
        }
        
        Spacer()
        
        
        Button(action: {
          presentationMode.wrappedValue.dismiss()
        }) {
          HStack {
            Text("Already have an account?")
              .font(.system(size: 14))
            Text("Sign In")
              .font(.system(size: 14, weight: .semibold))
          }
          .foregroundColor(.white)
          .padding(.bottom, 40)
        }
        
        
      }
    }
    .background(Color(#colorLiteral(red: 0.1170291379, green: 0.6328371167, blue: 0.951066196, alpha: 1)))
    .ignoresSafeArea()
  }
}

struct RegistrationView_Previews: PreviewProvider {
  static var previews: some View {
    RegistrationView()
  }
}
