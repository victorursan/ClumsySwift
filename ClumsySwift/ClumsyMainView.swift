//
//  ClumsyMainView.swift
//  ClumsySwift
//
//  Created by Victor Ursan on 7/24/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit

class ClumsyMainView: UIView {
  
  private var colorList: Array<UIColor>?
  private var counter = 1
  
  required init(coder: NSCoder) {
    fatalError("NSCoding not supported")
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    colorList = [colorForImageAtIndex(0), colorForImageAtIndex(1), colorForImageAtIndex(2), colorForImageAtIndex(3), colorForImageAtIndex(4), colorForImageAtIndex(5), colorForImageAtIndex(6), colorForImageAtIndex(7)]
    backgroundColor = colorForImageAtIndex(0)

  }

  internal func nextBackgroundColor() {
    if counter > 7 {counter = 0}
    backgroundColor = colorList![counter++]
  }
  
  internal func resetBackgroundColor() {
    counter = 0
    backgroundColor = colorList![counter++]
  }
  
  private func colorForImageAtIndex(index: Int) -> UIColor {
    return UIColor(patternImage: imageForContextAtIndex(index))
  }
  
  private func imageForContextAtIndex(index: Int) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
    drawRectImageFor(index)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
  }
  
  private func drawRectImageFor(index: Int) {
    //// General Declarations
    let context = UIGraphicsGetCurrentContext()
    var colors: [CGColor] = Array()
    
    switch index {
    case 0:
      //// Color Declaration
      colors = [UIColor(red: 1.000, green: 0.114, blue: 0.114, alpha: 1.000).CGColor,
        UIColor(red: 1.000, green: 0.574, blue: 0.000, alpha: 1.000).CGColor,
        UIColor(red: 1.000, green: 0.344, blue: 0.057, alpha: 1.000).CGColor]
      
    case 1:
      //// Color Declarations
      colors = [UIColor(red: 0.794, green: 0.382, blue: 1.000, alpha: 1.000).CGColor,
        UIColor(red: 0.479, green: 0.000, blue: 0.718, alpha: 1.000).CGColor,
        UIColor(red: 0.636, green: 0.191, blue: 0.859, alpha: 1.000).CGColor]
      
    case 2:
      //// Color Declarations
      colors = [UIColor(red: 0.990, green: 1.000, blue: 0.000, alpha: 1.000).CGColor,
        UIColor(red: 0.999, green: 0.734, blue: 0.155, alpha: 1.000).CGColor,
        UIColor(red: 0.995, green: 0.867, blue: 0.078, alpha: 1.000).CGColor]
      
    case 3:
      //// Color Declarations
      colors = [UIColor(red: 0.000, green: 0.908, blue: 0.908, alpha: 1.000).CGColor,
        UIColor(red: 0.000, green: 0.756, blue: 0.756, alpha: 1.000).CGColor,
        UIColor(red: 0.000, green: 0.832, blue: 0.832, alpha: 1.000).CGColor]
      
    case 4:
      //// Color Declarations
      colors = [UIColor(red: 1.000, green: 0.000, blue: 0.853, alpha: 1.000).CGColor,
        UIColor(red: 1.000, green: 0.000, blue: 0.465, alpha: 1.000).CGColor,
        UIColor(red: 1.000, green: 0.000, blue: 0.659, alpha: 1.000).CGColor]
      
    case 5:
      //// Color Declarations
      colors = [UIColor(red: 0.080, green: 0.678, blue: 0.000, alpha: 1.000).CGColor,
        UIColor(red: 0.000, green: 1.000, blue: 0.000, alpha: 1.000).CGColor,
        UIColor(red: 0.040, green: 0.839, blue: 0.000, alpha: 1.000).CGColor]
      
    case 6:
      //// Color Declarations
      colors = [UIColor(red: 1.000, green: 0.730, blue: 0.000, alpha: 1.000).CGColor,
        UIColor(red: 1.000, green: 0.487, blue: 0.000, alpha: 1.000).CGColor,
        UIColor(red: 1.000, green: 0.609, blue: 0.000, alpha: 1.000).CGColor]
      
    case 7:
      //// Color Declarations
      colors = [UIColor(red: 0.000, green: 0.539, blue: 1.000, alpha: 1.000).CGColor,
        UIColor(red: 0.001, green: 0.001, blue: 0.704, alpha: 1.000).CGColor,
        UIColor(red: 0.001, green: 0.270, blue: 0.852, alpha: 1.000).CGColor]
    default:
      println("Error")
    }
    
    //// Gradient Declarations
    let gradient = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(),
      [colors[0],colors[2],colors[1],colors[2],colors[0]],
      [0, 0.21, 0.5, 0.8, 1])
    
    //// Rectangle Drawing
    let rectanglePath = UIBezierPath(rect:frame)
    CGContextSaveGState(context)
    rectanglePath.addClip()
    CGContextDrawLinearGradient(context, gradient, CGPointMake(frame.width/2, -0), CGPointMake(frame.width/2, frame.height), 0)
    CGContextRestoreGState(context)
    
  }
  
}
