//
//  UIImage+Extension.swift
//  BestOf
//
//  Created by Joshua Basche on 6/16/21.
//

import Foundation
import UIKit

extension UIImage {
  
  func resized(width: CGFloat) -> UIImage? {
    
    let canvas = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
    let format = imageRendererFormat
    
    return UIGraphicsImageRenderer(size: canvas, format: format).image {
      _ in draw(in: CGRect(origin: .zero, size: canvas))
    }
    
  }
  
}
