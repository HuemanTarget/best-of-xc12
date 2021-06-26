//
//  LoginView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/26/21.
//

import SwiftUI

struct LoginView: View {
  @EnvironmentObject var authVM: AuthViewModel
  
  @State var email: String = ""
  @State var password: String = ""
  
  var body: some View {
    NavigationView {
      ZStack {
        VStack {
          Image("")
            .resizable()
            .scaledToFill()
            .frame(width: 220, height: 100)
            .padding(.top, 88)
            .padding(.bottom, 32)
          
          VStack(spacing: 20) {
            CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
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
          
          HStack {
            Spacer()
            
            Button(action: {
              
            }) {
              Text("Forgot Password?")
                .font(.footnote)
                .bold()
                .foregroundColor(.white)
                .padding(.top, 16)
                .padding(.trailing, 32)
            }
          }
          
          Button(action: {
            authVM.login(email: email, password: password)
          }) {
            Text("Sign In")
              .font(.headline)
              .foregroundColor(Color(#colorLiteral(red: 0.1170291379, green: 0.6328371167, blue: 0.951066196, alpha: 1)))
              .frame(width: 360, height: 50)
              .background(Color.white)
              .cornerRadius(25)
              .padding()
          }
          
          Spacer()
          
          NavigationLink(destination: RegistrationView().navigationBarBackButtonHidden(true)) {
            HStack {
              Text("Don't have an account?")
                .font(.system(size: 14))
              Text("Sign Up")
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
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
