//
//  ClumsyActionView.swift
//  ClumsySwift
//
//  Created by Victor Ursan on 7/25/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit

class ClumsyActionView: UIView {

  private var actionDictionary: [Action : UIImage] = Dictionary()
  private var currentImageView: UIImageView
  var action: Action?

  required init(coder: NSCoder) {
    fatalError("NSCoding not supported")
  }

  override init(frame: CGRect) {
    currentImageView = UIImageView(frame: frame)
    super.init(frame: frame)
    for action in allActions {actionDictionary[action] = imageForContextAction(action)}
    backgroundColor = UIColor.clearColor()
    currentImageView.center = center
    addSubview(currentImageView)
  }

  override func didMoveToSuperview() {
    center = superview!.center
  }

  internal func viewForAction(action: Action) {
    self.action = action
    currentImageView.removeFromSuperview()
    currentImageView.image = actionDictionary[action]
    currentImageView.contentMode = UIViewContentMode.ScaleAspectFit
    addSubview(currentImageView)
  }

  private func imageForContextAction(action: Action) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(380, 450), false, 0)
    drawRectImageFor(action)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
  }

  private func drawRectImageFor(action: Action) {
    //// General Declarations
    let context = UIGraphicsGetCurrentContext()
    let contextFrame = CGRectMake(0,0,380, 450)
    //// Color Declarations
    let fillColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)

    //// Shadow Declarations
    let textShadow = fillColor
    let textShadowOffset = CGSizeMake(0.1, -0.1)
    let textShadowBlurRadius: CGFloat = 5

    switch action {
    case .Start:
      //// Start Drawing
      let startRect: CGRect = CGRectMake(contextFrame.minX + 21, contextFrame.minY + 145, 339, 170)
      var startTextContent = NSString(string: "Start")
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, textShadowOffset, textShadowBlurRadius, textShadow.CGColor)
      let startStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
      startStyle.alignment = NSTextAlignment.Center;

      let startFontAttributes = [NSFontAttributeName: UIFont(name: clumsyFont, size: 150)!,
        NSForegroundColorAttributeName: fillColor,
        NSParagraphStyleAttributeName: startStyle]

      startTextContent.drawInRect(CGRectOffset(startRect,0,
        (startRect.height - startTextContent.boundingRectWithSize(startRect.size,
          options: NSStringDrawingOptions.UsesLineFragmentOrigin,
          attributes: startFontAttributes, context: nil).size.height) / 2),
        withAttributes: startFontAttributes);
      CGContextRestoreGState(context)
    case .SwipeLeft:
      //// Swipe Drawing
      let swipeRect: CGRect = CGRectMake(contextFrame.minX + 8, contextFrame.minY, 364, 142)
      var swipeTextContent = NSString(string: "Swipe")
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, textShadowOffset, textShadowBlurRadius, textShadow.CGColor)
      let swipeStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
      swipeStyle.alignment = NSTextAlignment.Center;

      let swipeFontAttributes = [NSFontAttributeName: UIFont(name: clumsyFont, size: 110)!,
        NSForegroundColorAttributeName: fillColor,
        NSParagraphStyleAttributeName: swipeStyle]

      swipeTextContent.drawInRect(CGRectOffset(swipeRect, 0, (swipeRect.height - swipeTextContent.boundingRectWithSize(swipeRect.size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: swipeFontAttributes, context: nil).size.height) / 2), withAttributes: swipeFontAttributes);
      CGContextRestoreGState(context)

      //// Rectangle L Drawing
      var rectangleLPath = UIBezierPath()
      rectangleLPath.moveToPoint(CGPointMake(contextFrame.minX + 130.2, contextFrame.minY + 244.5))
      rectangleLPath.addLineToPoint(CGPointMake(contextFrame.minX + 40.5, contextFrame.minY + 302.99))
      rectangleLPath.addLineToPoint(CGPointMake(contextFrame.minX + 130.2, contextFrame.minY + 359.5))
      rectangleLPath.addLineToPoint(CGPointMake(contextFrame.minX + 130.2, contextFrame.minY + 329.76))
      rectangleLPath.addLineToPoint(CGPointMake(contextFrame.minX + 340.5, contextFrame.minY + 329.76))
      rectangleLPath.addLineToPoint(CGPointMake(contextFrame.minX + 339.5, contextFrame.minY + 276.22))
      rectangleLPath.addLineToPoint(CGPointMake(contextFrame.minX + 130.2, contextFrame.minY + 276.22))
      rectangleLPath.addLineToPoint(CGPointMake(contextFrame.minX + 130.2, contextFrame.minY + 244.5))
      rectangleLPath.closePath()
      rectangleLPath.lineCapStyle = kCGLineCapRound;
      rectangleLPath.lineJoinStyle = kCGLineJoinRound;

      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, textShadowOffset, textShadowBlurRadius, textShadow.CGColor)
      fillColor.setFill()
      rectangleLPath.fill()
      CGContextRestoreGState(context)

      fillColor.setStroke()
      rectangleLPath.lineWidth = 1
      rectangleLPath.stroke()

    case .SwipeRight:
      //// Swipe Drawing
      let swipeRect: CGRect = CGRectMake(contextFrame.minX + 8, contextFrame.minY, 364, 142)
      var swipeTextContent = NSString(string: "Swipe")
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, textShadowOffset, textShadowBlurRadius, textShadow.CGColor)
      let swipeStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
      swipeStyle.alignment = NSTextAlignment.Center;

      let swipeFontAttributes = [NSFontAttributeName: UIFont(name: clumsyFont, size: 110)!,
        NSForegroundColorAttributeName: fillColor,
        NSParagraphStyleAttributeName: swipeStyle]

      swipeTextContent.drawInRect(CGRectOffset(swipeRect, 0, (swipeRect.height - swipeTextContent.boundingRectWithSize(swipeRect.size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: swipeFontAttributes, context: nil).size.height) / 2), withAttributes: swipeFontAttributes);
      CGContextRestoreGState(context)

      //// Rectangle R Drawing
      var rectangleRPath = UIBezierPath()
      rectangleRPath.moveToPoint(CGPointMake(contextFrame.minX + 250.8, contextFrame.minY + 244.5))
      rectangleRPath.addLineToPoint(CGPointMake(contextFrame.minX + 340.5, contextFrame.minY + 302.99))
      rectangleRPath.addLineToPoint(CGPointMake(contextFrame.minX + 250.8, contextFrame.minY + 359.5))
      rectangleRPath.addLineToPoint(CGPointMake(contextFrame.minX + 250.8, contextFrame.minY + 329.76))
      rectangleRPath.addLineToPoint(CGPointMake(contextFrame.minX + 40.5, contextFrame.minY + 329.76))
      rectangleRPath.addLineToPoint(CGPointMake(contextFrame.minX + 41.5, contextFrame.minY + 276.22))
      rectangleRPath.addLineToPoint(CGPointMake(contextFrame.minX + 250.8, contextFrame.minY + 276.22))
      rectangleRPath.addLineToPoint(CGPointMake(contextFrame.minX + 250.8, contextFrame.minY + 244.5))
      rectangleRPath.closePath()
      rectangleRPath.lineCapStyle = kCGLineCapRound;
      rectangleRPath.lineJoinStyle = kCGLineJoinRound;

      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, textShadowOffset, textShadowBlurRadius, textShadow.CGColor)
      fillColor.setFill()
      rectangleRPath.fill()
      CGContextRestoreGState(context)

      fillColor.setStroke()
      rectangleRPath.lineWidth = 1
      rectangleRPath.stroke()

    case .SwipeUp:
      //// Swipe Drawing
      let swipeRect: CGRect = CGRectMake(contextFrame.minX + 8, contextFrame.minY, 364, 142)
      var swipeTextContent = NSString(string: "Swipe")
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, textShadowOffset, textShadowBlurRadius, textShadow.CGColor)
      let swipeStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
      swipeStyle.alignment = NSTextAlignment.Center;

      let swipeFontAttributes = [NSFontAttributeName: UIFont(name: clumsyFont, size: 110)!,
        NSForegroundColorAttributeName: fillColor,
        NSParagraphStyleAttributeName: swipeStyle]



      swipeTextContent.drawInRect(CGRectOffset(swipeRect, 0, (swipeRect.height - swipeTextContent.boundingRectWithSize(swipeRect.size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: swipeFontAttributes, context: nil).size.height) / 2), withAttributes: swipeFontAttributes);
      CGContextRestoreGState(context)

      //// Rectangle U Drawing
      var rectangleUPath = UIBezierPath()
      rectangleUPath.moveToPoint(CGPointMake(contextFrame.minX + 163.97, contextFrame.minY + 231.6))
      rectangleUPath.addLineToPoint(CGPointMake(contextFrame.minX + 163.9, contextFrame.minY + 441.5))
      rectangleUPath.addLineToPoint(CGPointMake(contextFrame.minX + 216.66, contextFrame.minY + 441.5))
      rectangleUPath.addLineToPoint(CGPointMake(contextFrame.minX + 216.66, contextFrame.minY + 231.62))
      rectangleUPath.addLineToPoint(CGPointMake(contextFrame.minX + 247.5, contextFrame.minY + 231.57))
      rectangleUPath.addLineToPoint(CGPointMake(contextFrame.minX + 190.69, contextFrame.minY + 141.5))
      rectangleUPath.addLineToPoint(CGPointMake(contextFrame.minX + 132.5, contextFrame.minY + 231.6))
      rectangleUPath.addLineToPoint(CGPointMake(contextFrame.minX + 163.97, contextFrame.minY + 231.6))
      rectangleUPath.closePath()
      rectangleUPath.lineCapStyle = kCGLineCapRound;
      rectangleUPath.lineJoinStyle = kCGLineJoinBevel;

      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, textShadowOffset, textShadowBlurRadius, textShadow.CGColor)
      fillColor.setFill()
      rectangleUPath.fill()
      CGContextRestoreGState(context)

      fillColor.setStroke()
      rectangleUPath.lineWidth = 1
      rectangleUPath.stroke()

    case .SwipeDown:
      //// Swipe Drawing
      let swipeRect: CGRect = CGRectMake(contextFrame.minX + 8, contextFrame.minY, 364, 142)
      var swipeTextContent = NSString(string: "Swipe")
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, textShadowOffset, textShadowBlurRadius, textShadow.CGColor)
      let swipeStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
      swipeStyle.alignment = NSTextAlignment.Center;

      let swipeFontAttributes = [NSFontAttributeName: UIFont(name: clumsyFont, size: 110)!,
        NSForegroundColorAttributeName: fillColor,
        NSParagraphStyleAttributeName: swipeStyle]

      swipeTextContent.drawInRect(CGRectOffset(swipeRect, 0, (swipeRect.height - swipeTextContent.boundingRectWithSize(swipeRect.size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: swipeFontAttributes, context: nil).size.height) / 2), withAttributes: swipeFontAttributes);
      CGContextRestoreGState(context)

      //// Rectangle D Drawing
      var rectangleDPath = UIBezierPath()
      rectangleDPath.moveToPoint(CGPointMake(contextFrame.minX + 163.97, contextFrame.minY + 351.4))
      rectangleDPath.addLineToPoint(CGPointMake(contextFrame.minX + 163.9, contextFrame.minY + 141.5))
      rectangleDPath.addLineToPoint(CGPointMake(contextFrame.minX + 216.66, contextFrame.minY + 141.5))
      rectangleDPath.addLineToPoint(CGPointMake(contextFrame.minX + 216.66, contextFrame.minY + 351.38))
      rectangleDPath.addLineToPoint(CGPointMake(contextFrame.minX + 247.5, contextFrame.minY + 351.43))
      rectangleDPath.addLineToPoint(CGPointMake(contextFrame.minX + 190.69, contextFrame.minY + 441.5))
      rectangleDPath.addLineToPoint(CGPointMake(contextFrame.minX + 132.5, contextFrame.minY + 351.4))
      rectangleDPath.addLineToPoint(CGPointMake(contextFrame.minX + 163.97, contextFrame.minY + 351.4))
      rectangleDPath.closePath()
      rectangleDPath.lineCapStyle = kCGLineCapRound;
      rectangleDPath.lineJoinStyle = kCGLineJoinBevel;

      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, textShadowOffset, textShadowBlurRadius, textShadow.CGColor)
      fillColor.setFill()
      rectangleDPath.fill()
      CGContextRestoreGState(context)

      fillColor.setStroke()
      rectangleDPath.lineWidth = 1
      rectangleDPath.stroke()

    case .Shake:
      //// Shake Drawing
      let shakeRect: CGRect = CGRectMake(contextFrame.minX + 22, contextFrame.minY + 150, 337, 150)
      var shakeTextContent = NSString(string: "Shake")
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, textShadowOffset, textShadowBlurRadius, textShadow.CGColor)
      let shakeStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
      shakeStyle.alignment = NSTextAlignment.Center;

      let shakeFontAttributes = [NSFontAttributeName: UIFont(name: clumsyFont, size: 110)!,
        NSForegroundColorAttributeName: fillColor,
        NSParagraphStyleAttributeName: shakeStyle]

      shakeTextContent.drawInRect(CGRectOffset(shakeRect, 0, (shakeRect.height - shakeTextContent.boundingRectWithSize(shakeRect.size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: shakeFontAttributes, context: nil).size.height) / 2), withAttributes: shakeFontAttributes);
      CGContextRestoreGState(context)

    case .Tap:
      //// Tap Drawing
      let tapRect: CGRect = CGRectMake(contextFrame.minX + 30, contextFrame.minY + 150, 320, 150)
      var tapTextContent = NSString(string: "Tap")
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, textShadowOffset, textShadowBlurRadius, textShadow.CGColor)
      let tapStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
      tapStyle.alignment = NSTextAlignment.Center;

      let tapFontAttributes = [NSFontAttributeName: UIFont(name: clumsyFont, size: 110)!,
        NSForegroundColorAttributeName: fillColor,
        NSParagraphStyleAttributeName: tapStyle]

      tapTextContent.drawInRect(CGRectOffset(tapRect, 0, (tapRect.height - tapTextContent.boundingRectWithSize(tapRect.size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: tapFontAttributes, context: nil).size.height) / 2), withAttributes: tapFontAttributes);
      CGContextRestoreGState(context)

    case .DoubleTap:
      //// Double Tap Drawing
      let doubleTapRect: CGRect = CGRectMake(contextFrame.minX + 12, contextFrame.minY + 45, 356, 360)
      var doubleTapTextContent = NSString(string: "Double Tap")
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, textShadowOffset, textShadowBlurRadius, textShadow.CGColor)
      let doubleTapStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
      doubleTapStyle.alignment = NSTextAlignment.Center;

      let doubleTapFontAttributes = [NSFontAttributeName: UIFont(name: clumsyFont, size: 110)!,
        NSForegroundColorAttributeName: fillColor,
        NSParagraphStyleAttributeName: doubleTapStyle]

      doubleTapTextContent.drawInRect(CGRectOffset(doubleTapRect, 0, (doubleTapRect.height - doubleTapTextContent.boundingRectWithSize(doubleTapRect.size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: doubleTapFontAttributes, context: nil).size.height) / 2), withAttributes: doubleTapFontAttributes);
      CGContextRestoreGState(context)
      
    default:
      println("Error")
    }
  }
  
}
