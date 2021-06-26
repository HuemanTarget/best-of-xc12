//
//  TextArea.swift
//  BestOf
//
//  Created by Joshua Basche on 6/26/21.
//

import SwiftUI

struct TextArea: View {
  @Binding var text: String
  let placeholder: String
  
  init(_ placeholder: String, text: Binding<String>) {
    self._text = text
    self.placeholder = placeholder
    UITextView.appearance().backgroundColor = .clear
  }
  
  var body: some View {
    ZStack(alignment: .topLeading) {
      if text.isEmpty {
        Text(placeholder)
          .foregroundColor(Color(.placeholderText))
          .padding(.horizontal, 9)
          .padding(.vertical, 12)
      }
      
      TextEditor(text: $text)
        .padding(4)
    }
    .font(.body)
  }
}
