//
//  ClumsyOkButton.swift
//  ClumsySwift
//
//  Created by Victor Ursan on 8/1/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit

protocol ClumsyOkButtonDelegate {
  func okButtonPressed()
}

class ClumsyOkButton: UIButton {
  
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init(frame: CGRect, target: AnyObject) {
    super.init(frame: frame)
    setBackgroundImage(imageForOkButtonState(.Normal), forState: .Normal)
    setBackgroundImage(imageForOkButtonState(.Highlighted), forState: .Highlighted)
    addTarget(target, action: "okButtonPressed", forControlEvents: .TouchUpInside)
    contentMode = .ScaleAspectFit
  }

  private func imageForOkButtonState(state: UIControlState) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(145, 100), false, 0)
    drawOkButton(state)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
  }
  
  private func drawOkButton(state: UIControlState) {
    //// General Declarations
    let context = UIGraphicsGetCurrentContext()
    let frame = CGRectMake(0, 0, 145, 100)
    //// Color Declarations
    let shadowColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
    let fillColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
    let highlightedColor = UIColor(red: 0.800, green: 0.616, blue: 0.153, alpha: 1.000)
    
    //// Shadow Declarations
    let buttonShadow = shadowColor.colorWithAlphaComponent(0.67)
    let buttonShadowOffset = CGSizeMake(0.1, -0.1)
    let buttonShadowBlurRadius: CGFloat = 7
    
    //// Bezier 6 Drawing
    var bezierPath = UIBezierPath()
    bezierPath.moveToPoint(CGPointMake(frame.minX + 67.02, frame.minY + 28.33))
    bezierPath.addCurveToPoint(CGPointMake(frame.minX + 72.48, frame.minY + 43.08), controlPoint1: CGPointMake(frame.minX + 69.95, frame.minY + 32.39), controlPoint2: CGPointMake(frame.minX + 71.77, frame.minY + 37.3))
    bezierPath.addLineToPoint(CGPointMake(frame.minX + 64.26, frame.minY + 43.08))
    bezierPath.addCurveToPoint(CGPointMake(frame.minX + 59.35, frame.minY + 31.82), controlPoint1: CGPointMake(frame.minX + 63.52, frame.minY + 38.64), controlPoint2: CGPointMake(frame.minX + 61.88, frame.minY + 34.88))
    bezierPath.addCurveToPoint(CGPointMake(frame.minX + 51.46, frame.minY + 26.36), controlPoint1: CGPointMake(frame.minX + 57.2, frame.minY + 29.22), controlPoint2: CGPointMake(frame.minX + 54.57, frame.minY + 27.4))
    bezierPath.addCurveToPoint(CGPointMake(frame.minX + 44.66, frame.minY + 25.33), controlPoint1: CGPointMake(frame.minX + 49.4, frame.minY + 25.67), controlPoint2: CGPointMake(frame.minX + 47.14, frame.minY + 25.33))
    bezierPath.addCurveToPoint(CGPointMake(frame.minX + 41.51, frame.minY + 25.54), controlPoint1: CGPointMake(frame.minX + 43.57, frame.minY + 25.33), controlPoint2: CGPointMake(frame.minX + 42.52, frame.minY + 25.4))
    bezierPath.addCurveToPoint(CGPointMake(frame.minX + 29.91, frame.minY + 31.76), controlPoint1: CGPointMake(frame.minX + 36.9, frame.minY + 26.17), controlPoint2: CGPointMake(frame.minX + 33.03, frame.minY + 28.25))
    bezierPath.addCurveToPoint(CGPointMake(frame.minX + 24.2, frame.minY + 50.73), controlPoint1: CGPointMake(frame.minX + 26.1, frame.minY + 36.05), controlPoint2: CGPointMake(frame.minX + 24.2, frame.minY + 42.37))
    bezierPath.addCurveToPoint(CGPointMake(frame.minX + 29.1, frame.minY + 67.65), controlPoint1: CGPointMake(frame.minX + 24.2, frame.minY + 57.42), controlPoint2: CGPointMake(frame.minX + 25.83, frame.minY + 63.06))
    bezierPath.addCurveToPoint(CGPointMake(frame.minX + 44.98, frame.minY + 74.54), controlPoint1: CGPointMake(frame.minX + 32.36, frame.minY + 72.24), controlPoint2: CGPointMake(frame.minX + 37.66, frame.minY + 74.54))
    bezierPath.addCurveToPoint(CGPointMake(frame.minX + 60.07, frame.minY + 66.79), controlPoint1: CGPointMake(frame.minX + 51.93, frame.minY + 74.54), controlPoint2: CGPointMake(frame.minX + 56.96, frame.minY + 71.95))
    bezierPath.addCurveToPoint(CGPointMake(frame.minX + 63.89, frame.minY + 57.06), controlPoint1: CGPointMake(frame.minX + 61.86, frame.minY + 63.8), controlPoint2: CGPointMake(frame.minX + 63.14, frame.minY + 60.56))
    bezierPath.addLineToPoint(CGPointMake(frame.minX + 72.13, frame.minY + 57.06))
    bezierPath.addCurveToPoint(CGPointMake(frame.minX + 66.19, frame.minY + 71.33), controlPoint1: CGPointMake(frame.minX + 71.17, frame.minY + 62.52), controlPoint2: CGPointMake(frame.minX + 69.19, frame.minY + 67.27))
    bezierPath.addCurveToPoint(CGPointMake(frame.minX + 60.85, frame.minY + 76.76), controlPoint1: CGPointMake(frame.minX + 64.61, frame.minY + 73.47), controlPoint2: CGPointMake(frame.minX + 62.83, frame.minY + 75.28))
    bezierPath.addCurveToPoint(CGPointMake(frame.minX + 44.03, frame.minY + 81.85), controlPoint1: CGPointMake(frame.minX + 56.31, frame.minY + 80.16), controlPoint2: CGPointMake(frame.minX + 50.7, frame.minY + 81.85))
    bezierPath.addCurveToPoint(CGPointMake(frame.minX + 22.89, frame.minY + 72.65), controlPoint1: CGPointMake(frame.minX + 35.07, frame.minY + 81.85), controlPoint2: CGPointMake(frame.minX + 28.02, frame.minY + 78.79))
    bezierPath.addCurveToPoint(CGPointMake(frame.minX + 16.03, frame.minY + 50.2), controlPoint1: CGPointMake(frame.minX + 18.32, frame.minY + 66.73), controlPoint2: CGPointMake(frame.minX + 16.03, frame.minY + 59.24))
    bezierPath.addCurveToPoint(CGPointMake(frame.minX + 21.9, frame.minY + 29.23), controlPoint1: CGPointMake(frame.minX + 16.03, frame.minY + 42.03), controlPoint2: CGPointMake(frame.minX + 17.99, frame.minY + 35.04))
    bezierPath.addCurveToPoint(CGPointMake(frame.minX + 44.18, frame.minY + 18.05), controlPoint1: CGPointMake(frame.minX + 26.92, frame.minY + 21.78), controlPoint2: CGPointMake(frame.minX + 34.35, frame.minY + 18.05))
    bezierPath.addCurveToPoint(CGPointMake(frame.minX + 67.02, frame.minY + 28.33), controlPoint1: CGPointMake(frame.minX + 54.47, frame.minY + 18.05), controlPoint2: CGPointMake(frame.minX + 62.08, frame.minY + 21.48))
    bezierPath.closePath()
    bezierPath.moveToPoint(CGPointMake(frame.minX + 104.97, frame.minY + 44.03))
    bezierPath.addLineToPoint(CGPointMake(frame.minX + 129.87, frame.minY + 80.09))
    bezierPath.addLineToPoint(CGPointMake(frame.minX + 119.6, frame.minY + 80.09))
    bezierPath.addLineToPoint(CGPointMake(frame.minX + 99.22, frame.minY + 49.79))
    bezierPath.addLineToPoint(CGPointMake(frame.minX + 89.9, frame.minY + 59.04))
    bezierPath.addLineToPoint(CGPointMake(frame.minX + 89.9, frame.minY + 80.09))
    bezierPath.addLineToPoint(CGPointMake(frame.minX + 82.21, frame.minY + 80.09))
    bezierPath.addLineToPoint(CGPointMake(frame.minX + 82.21, frame.minY + 19.7))
    bezierPath.addLineToPoint(CGPointMake(frame.minX + 89.9, frame.minY + 19.7))
    bezierPath.addLineToPoint(CGPointMake(frame.minX + 89.9, frame.minY + 49.13))
    bezierPath.addLineToPoint(CGPointMake(frame.minX + 118.29, frame.minY + 19.7))
    bezierPath.addLineToPoint(CGPointMake(frame.minX + 129.2, frame.minY + 19.7))
    bezierPath.addLineToPoint(CGPointMake(frame.minX + 104.97, frame.minY + 44.03))
    bezierPath.closePath()
    bezierPath.moveToPoint(CGPointMake(frame.minX + 68, frame.minY + 47.47))
    bezierPath.addLineToPoint(CGPointMake(frame.minX + 77.67, frame.minY + 57.06))
    bezierPath.addLineToPoint(CGPointMake(frame.minX + 58.32, frame.minY + 57.06))
    bezierPath.addLineToPoint(CGPointMake(frame.minX + 68, frame.minY + 47.47))
    bezierPath.closePath()
    
    switch state {
    case UIControlState.Normal:
    CGContextSaveGState(context)
    CGContextSetShadowWithColor(context, buttonShadowOffset, buttonShadowBlurRadius, buttonShadow.CGColor)
    fillColor.setFill()
    bezierPath.fill()
    CGContextRestoreGState(context)
    case UIControlState.Highlighted:
      highlightedColor.setFill()
      bezierPath.fill()
    default:
      println("Error")
    }
  }

}
