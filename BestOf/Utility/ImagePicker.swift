//
//  ImagePicker.swift
//  BestOf
//
//  Created by Joshua Basche on 6/16/21.
//

import Foundation
import SwiftUI

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
  
  @Binding var isShown: Bool
  @Binding var image: Image?
  @Binding var originalImage: UIImage?
  
  init(isShown: Binding<Bool>, image: Binding<Image?>, originalImage: Binding<UIImage?>) {
    _isShown = isShown
    _image = image
    _originalImage = originalImage
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
    let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
    image = Image(uiImage: uiImage)
    isShown = false
    originalImage = uiImage
    
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    isShown = false
  }
  
}

struct ImagePicker: UIViewControllerRepresentable {
  
  @Binding var isShown: Bool
  @Binding var image: Image?
  @Binding var originalImage: UIImage?
  var sourceType: SourceType
  
  func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
  }
  
  func makeCoordinator() -> ImagePickerCoordinator {
    return ImagePickerCoordinator(isShown: $isShown, image: $image, originalImage: $originalImage)
  }
  
  func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
    let picker = UIImagePickerController()
    picker.sourceType = sourceType == .camera ? .camera : .photoLibrary
    picker.delegate = context.coordinator
    return picker
  }
  
}
