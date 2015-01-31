//
//  ClumsySocialButton.swift
//  ClumsySwift
//
//  Created by Victor Ursan on 7/30/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit

protocol ClumsySocialButtonDelegate {
  func socialButtonPressed(type: SocialButton)
}

enum SocialButton {
  case FacebookShare
  case TwitterShare
  case FacebookScore
  case TwitterScore
  case LeaderboardMain
  case LeaderboardScore
}

class ClumsySocialButton: UIButton {

  private var delegate: ClumsySocialButtonDelegate

  required init(coder: NSCoder) {
    fatalError("NSCoding not supported")
  }

  init(button: SocialButton,frame: CGRect, target: ClumsySocialButtonDelegate) {
    delegate = target
    super.init(frame: frame)
    switch button {
    case .FacebookShare:
      setBackgroundImage(imageForContextShareButton(.FacebookShare, state: .Normal), forState: .Normal)
      setBackgroundImage(imageForContextShareButton(.FacebookShare, state: .Highlighted), forState: .Highlighted)
      addTarget(self, action: "facebookShareButtonEvent", forControlEvents: .TouchUpInside)
    case .TwitterShare:
      setBackgroundImage(imageForContextShareButton(.TwitterShare, state: .Normal), forState: .Normal)
      setBackgroundImage(imageForContextShareButton(.TwitterShare, state: .Highlighted), forState: .Highlighted)
      addTarget(self, action: "twitterShareButtonEvent", forControlEvents: .TouchUpInside)
    case .FacebookScore:
      setBackgroundImage(imageForContextScoreButton(.FacebookScore, state: .Normal), forState: .Normal)
      setBackgroundImage(imageForContextScoreButton(.FacebookScore, state: .Highlighted), forState: .Highlighted)
      addTarget(self, action: "facebookScoreButtonEvent", forControlEvents: .TouchUpInside)
    case .TwitterScore:
      setBackgroundImage(imageForContextScoreButton(.TwitterScore, state: .Normal), forState: .Normal)
      setBackgroundImage(imageForContextScoreButton(.TwitterScore, state: .Highlighted), forState: .Highlighted)
      addTarget(self, action: "twitterScoreButtonEvent", forControlEvents: .TouchUpInside)
    case .LeaderboardMain:
      setBackgroundImage(imageForContextScoreButton(.LeaderboardMain, state: .Normal), forState: .Normal)
      setBackgroundImage(imageForContextScoreButton(.LeaderboardMain, state: .Highlighted), forState: .Highlighted)
      addTarget(self, action: "leaderboardMainButtonEvent", forControlEvents: .TouchUpInside)
    case .LeaderboardScore:
      setBackgroundImage(imageForContextScoreButton(.LeaderboardScore, state: .Normal), forState: .Normal)
      setBackgroundImage(imageForContextScoreButton(.LeaderboardScore, state: .Highlighted), forState: .Highlighted)
      addTarget(self, action: "leaderboardScoreButtonEvent", forControlEvents: .TouchUpInside)
    default:
      println("Error")
    }
    contentMode = .ScaleAspectFit
  }

  internal func facebookShareButtonEvent() {
    delegate.socialButtonPressed(.FacebookShare)
  }

  internal func twitterShareButtonEvent() {
    delegate.socialButtonPressed(.TwitterShare)
  }

  internal func facebookScoreButtonEvent() {
    delegate.socialButtonPressed(.FacebookScore)
  }

  internal func twitterScoreButtonEvent() {
    delegate.socialButtonPressed(.TwitterScore)
  }

  internal func leaderboardMainButtonEvent() {
    delegate.socialButtonPressed(.LeaderboardMain)
  }

  internal func leaderboardScoreButtonEvent() {
    delegate.socialButtonPressed(.LeaderboardScore)
  }

  private func imageForContextShareButton(button: SocialButton, state: UIControlState) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(150, 290), false, 0)
    switch button {
    case .FacebookShare: drawFacebookShare(state)
    case .TwitterShare: drawTwitterShare(state)
    case .LeaderboardMain: drawLeaderboardMain(state)
    default: println("Error")
    }
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
  }

  private func imageForContextScoreButton(button: SocialButton, state: UIControlState) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(95, 95), false, 0)
    switch button {
    case .FacebookScore: drawFacebookScore(state)
    case .TwitterScore: drawTwitterScore(state)
    case .LeaderboardScore: drawLeaderboardScore(state)
    default: println("Error")
    }
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
  }

  private func drawLeaderboardMain(state: UIControlState) {

  }

  private func drawLeaderboardScore(state: UIControlState) {
    let scoreFrame = CGRectMake(0, 0, 95, 95)
    //// General Declarations
    let context = UIGraphicsGetCurrentContext()


    var leaderboardColor: UIColor!
    var numberColor: UIColor!

    //// Color Declarations

    switch state {
    case UIControlState.Normal:
      leaderboardColor = UIColor(red: 0.990, green: 1.000, blue: 0.000, alpha: 1.000)
      numberColor = UIColor.whiteColor()
    case UIControlState.Highlighted:
      leaderboardColor = UIColor(red: 0.800, green: 0.616, blue: 0.153, alpha: 1.000)
      numberColor = UIColor(red: 0.734, green: 0.535, blue: 0.006, alpha: 1.000)
    default:
      println("Error")
    }

    let shadow8Color = UIColor(red: 0.724, green: 0.724, blue: 0.724, alpha: 1.000)

    //// Shadow Declarations
    let shadow8 = shadow8Color
    let shadow8Offset = CGSizeMake(0.1, -0.1)
    let shadow8BlurRadius: CGFloat = 3

    //// Group
    //// Rectangle 6 Drawing
    let rectangle6Path = UIBezierPath(roundedRect: CGRectMake(scoreFrame.minX + 35, scoreFrame.minY + 15, 26, 64), cornerRadius: 2)
    leaderboardColor.setFill()
    rectangle6Path.fill()


    //// Rectangle 7 Drawing
    let rectangle7Path = UIBezierPath(roundedRect: CGRectMake(scoreFrame.minX + 63, scoreFrame.minY + 35, 25, 44), cornerRadius: 2)
    leaderboardColor.setFill()
    rectangle7Path.fill()


    //// Rectangle 8 Drawing
    let rectangle8Path = UIBezierPath(roundedRect: CGRectMake(scoreFrame.minX + 8, scoreFrame.minY + 53, 25, 26), cornerRadius: 2)
    leaderboardColor.setFill()
    rectangle8Path.fill()


    //// Text 7 Drawing
    let text7Rect = CGRectMake(scoreFrame.minX + 35, scoreFrame.minY + 15, 26, 64)
    CGContextSaveGState(context)
    CGContextSetShadowWithColor(context, shadow8Offset, shadow8BlurRadius, (shadow8 as UIColor).CGColor)
    let text7Style = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
    text7Style.alignment = NSTextAlignment.Center

    let text7FontAttributes = [NSFontAttributeName: UIFont(name: "Arial-BoldMT", size: 23)!, NSForegroundColorAttributeName: numberColor, NSParagraphStyleAttributeName: text7Style]

    "1".drawInRect(text7Rect, withAttributes: text7FontAttributes)
    CGContextRestoreGState(context)



    //// Text 8 Drawing
    let text8Rect = CGRectMake(scoreFrame.minX + 63, scoreFrame.minY + 35, 25, 44)
    CGContextSaveGState(context)
    CGContextSetShadowWithColor(context, shadow8Offset, shadow8BlurRadius, (shadow8 as UIColor).CGColor)
    let text8Style = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
    text8Style.alignment = NSTextAlignment.Center

    let text8FontAttributes = [NSFontAttributeName: UIFont(name: "Arial-BoldMT", size: 23)!, NSForegroundColorAttributeName: numberColor, NSParagraphStyleAttributeName: text8Style]

    "2".drawInRect(text8Rect, withAttributes: text8FontAttributes)
    CGContextRestoreGState(context)



    //// Text 9 Drawing
    let text9Rect = CGRectMake(scoreFrame.minX + 8, scoreFrame.minY + 53, 25, 26)
    CGContextSaveGState(context)
    CGContextSetShadowWithColor(context, shadow8Offset, shadow8BlurRadius, (shadow8 as UIColor).CGColor)
    let text9Style = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
    text9Style.alignment = NSTextAlignment.Center

    let text9FontAttributes = [NSFontAttributeName: UIFont(name: "Arial-BoldMT", size: 23)!, NSForegroundColorAttributeName: numberColor, NSParagraphStyleAttributeName: text9Style]

    "3".drawInRect(text9Rect, withAttributes: text9FontAttributes)
    CGContextRestoreGState(context)
  }

  private func drawFacebookShare(state: UIControlState) {
    //// General Declarations
    let context = UIGraphicsGetCurrentContext()

    //// Color Declarations
    let facebookFrame = CGRectMake(0, 0, 150, 290)
    let facebookColor = UIColor(red: 0.255, green: 0.369, blue: 0.608, alpha: 1.000)
    let shadowColor2 = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
    let fillColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)

    //// Shadow Declarations
    let buttonShadow = shadowColor2.colorWithAlphaComponent(0.67)
    let buttonShadowOffset = CGSizeMake(0.1, -0.1)
    let buttonShadowBlurRadius: CGFloat = 7
    let textShadow = fillColor
    let textShadowOffset = CGSizeMake(0.1, -0.1)
    let textShadowBlurRadius: CGFloat = 5

    //// Facebook Case Drawing
    var facebookCasePath = UIBezierPath()
    facebookCasePath.moveToPoint(CGPointMake(facebookFrame.minX + 82.35, facebookFrame.minY + 103.61))
    facebookCasePath.addCurveToPoint(CGPointMake(facebookFrame.minX + 68.19, facebookFrame.minY + 107.32), controlPoint1: CGPointMake(facebookFrame.minX + 75.44, facebookFrame.minY + 103.61), controlPoint2: CGPointMake(facebookFrame.minX + 71.6, facebookFrame.minY + 104.43))
    facebookCasePath.addCurveToPoint(CGPointMake(facebookFrame.minX + 63.32, facebookFrame.minY + 119.91), controlPoint1: CGPointMake(facebookFrame.minX + 64.78, facebookFrame.minY + 110.21), controlPoint2: CGPointMake(facebookFrame.minX + 63.32, facebookFrame.minY + 114.13))
    facebookCasePath.addLineToPoint(CGPointMake(facebookFrame.minX + 63.7, facebookFrame.minY + 125.22))
    facebookCasePath.addLineToPoint(CGPointMake(facebookFrame.minX + 56.5, facebookFrame.minY + 125.22))
    facebookCasePath.addLineToPoint(CGPointMake(facebookFrame.minX + 56.5, facebookFrame.minY + 135.5))
    facebookCasePath.addLineToPoint(CGPointMake(facebookFrame.minX + 63.7, facebookFrame.minY + 135.5))
    facebookCasePath.addLineToPoint(CGPointMake(facebookFrame.minX + 63.7, facebookFrame.minY + 172.5))
    facebookCasePath.addLineToPoint(CGPointMake(facebookFrame.minX + 80.52, facebookFrame.minY + 172.5))
    facebookCasePath.addLineToPoint(CGPointMake(facebookFrame.minX + 80.52, facebookFrame.minY + 135.5))
    facebookCasePath.addLineToPoint(CGPointMake(facebookFrame.minX + 92.94, facebookFrame.minY + 135.5))
    facebookCasePath.addLineToPoint(CGPointMake(facebookFrame.minX + 92.94, facebookFrame.minY + 125.22))
    facebookCasePath.addLineToPoint(CGPointMake(facebookFrame.minX + 79.96, facebookFrame.minY + 125.22))
    facebookCasePath.addLineToPoint(CGPointMake(facebookFrame.minX + 79.96, facebookFrame.minY + 124.85))
    facebookCasePath.addCurveToPoint(CGPointMake(facebookFrame.minX + 80.86, facebookFrame.minY + 116.2), controlPoint1: CGPointMake(facebookFrame.minX + 79.96, facebookFrame.minY + 121.79), controlPoint2: CGPointMake(facebookFrame.minX + 79.69, facebookFrame.minY + 117.27))
    facebookCasePath.addCurveToPoint(CGPointMake(facebookFrame.minX + 86.46, facebookFrame.minY + 114.09), controlPoint1: CGPointMake(facebookFrame.minX + 82.03, facebookFrame.minY + 115.14), controlPoint2: CGPointMake(facebookFrame.minX + 83.16, facebookFrame.minY + 114.09))
    facebookCasePath.addCurveToPoint(CGPointMake(facebookFrame.minX + 94.5, facebookFrame.minY + 113.98), controlPoint1: CGPointMake(facebookFrame.minX + 87.83, facebookFrame.minY + 114.09), controlPoint2: CGPointMake(facebookFrame.minX + 94.5, facebookFrame.minY + 113.98))
    facebookCasePath.addLineToPoint(CGPointMake(facebookFrame.minX + 94.5, facebookFrame.minY + 103.61))
    facebookCasePath.addCurveToPoint(CGPointMake(facebookFrame.minX + 82.35, facebookFrame.minY + 103.61), controlPoint1: CGPointMake(facebookFrame.minX + 92.94, facebookFrame.minY + 103.36), controlPoint2: CGPointMake(facebookFrame.minX + 84.84, facebookFrame.minY + 103.61))
    facebookCasePath.closePath()
    facebookCasePath.moveToPoint(CGPointMake(facebookFrame.minX + 136, facebookFrame.minY + 0))
    facebookCasePath.addCurveToPoint(CGPointMake(facebookFrame.minX + 136, facebookFrame.minY + 62.3), controlPoint1: CGPointMake(facebookFrame.minX + 136, facebookFrame.minY), controlPoint2: CGPointMake(facebookFrame.minX + 136, facebookFrame.minY + 62.3))
    facebookCasePath.addLineToPoint(CGPointMake(facebookFrame.minX + 136, facebookFrame.minY + 282))
    facebookCasePath.addLineToPoint(CGPointMake(facebookFrame.minX + 75, facebookFrame.minY + 210.11))
    facebookCasePath.addLineToPoint(CGPointMake(facebookFrame.minX + 15.09, facebookFrame.minY + 282))
    facebookCasePath.addLineToPoint(CGPointMake(facebookFrame.minX + 14, facebookFrame.minY + 62.3))
    facebookCasePath.addLineToPoint(CGPointMake(facebookFrame.minX + 14, facebookFrame.minY))
    facebookCasePath.addLineToPoint(CGPointMake(facebookFrame.minX + 136, facebookFrame.minY))
    facebookCasePath.addLineToPoint(CGPointMake(facebookFrame.minX + 136, facebookFrame.minY + 0))
    facebookCasePath.closePath()
    CGContextSaveGState(context)
    CGContextSetShadowWithColor(context, buttonShadowOffset, buttonShadowBlurRadius, buttonShadow.CGColor)
    facebookColor.setFill()
    facebookCasePath.fill()
    CGContextRestoreGState(context)

    if(state == .Normal) {
      //// Facebook Letter Drawing
      var facebookLetterPath = UIBezierPath()
      facebookLetterPath.moveToPoint(CGPointMake(facebookFrame.minX + 95.5, facebookFrame.minY + 113.79))
      facebookLetterPath.addCurveToPoint(CGPointMake(facebookFrame.minX + 87.04, facebookFrame.minY + 113.9), controlPoint1: CGPointMake(facebookFrame.minX + 95.5, facebookFrame.minY + 113.79), controlPoint2: CGPointMake(facebookFrame.minX + 88.48, facebookFrame.minY + 113.9))
      facebookLetterPath.addCurveToPoint(CGPointMake(facebookFrame.minX + 81.14, facebookFrame.minY + 116.07), controlPoint1: CGPointMake(facebookFrame.minX + 83.56, facebookFrame.minY + 113.9), controlPoint2: CGPointMake(facebookFrame.minX + 82.37, facebookFrame.minY + 114.98))
      facebookLetterPath.addCurveToPoint(CGPointMake(facebookFrame.minX + 80.19, facebookFrame.minY + 124.96), controlPoint1: CGPointMake(facebookFrame.minX + 79.91, facebookFrame.minY + 117.17), controlPoint2: CGPointMake(facebookFrame.minX + 80.19, facebookFrame.minY + 121.82))
      facebookLetterPath.addLineToPoint(CGPointMake(facebookFrame.minX + 80.19, facebookFrame.minY + 125.35))
      facebookLetterPath.addLineToPoint(CGPointMake(facebookFrame.minX + 93.86, facebookFrame.minY + 125.35))
      facebookLetterPath.addLineToPoint(CGPointMake(facebookFrame.minX + 93.86, facebookFrame.minY + 135.92))
      facebookLetterPath.addLineToPoint(CGPointMake(facebookFrame.minX + 80.78, facebookFrame.minY + 135.92))
      facebookLetterPath.addLineToPoint(CGPointMake(facebookFrame.minX + 80.78, facebookFrame.minY + 174))
      facebookLetterPath.addLineToPoint(CGPointMake(facebookFrame.minX + 63.07, facebookFrame.minY + 174))
      facebookLetterPath.addLineToPoint(CGPointMake(facebookFrame.minX + 63.07, facebookFrame.minY + 135.92))
      facebookLetterPath.addLineToPoint(CGPointMake(facebookFrame.minX + 55.5, facebookFrame.minY + 135.92))
      facebookLetterPath.addLineToPoint(CGPointMake(facebookFrame.minX + 55.5, facebookFrame.minY + 125.35))
      facebookLetterPath.addLineToPoint(CGPointMake(facebookFrame.minX + 63.07, facebookFrame.minY + 125.35))
      facebookLetterPath.addLineToPoint(CGPointMake(facebookFrame.minX + 62.68, facebookFrame.minY + 119.88))
      facebookLetterPath.addCurveToPoint(CGPointMake(facebookFrame.minX + 67.81, facebookFrame.minY + 106.93), controlPoint1: CGPointMake(facebookFrame.minX + 62.68, facebookFrame.minY + 113.93), controlPoint2: CGPointMake(facebookFrame.minX + 64.22, facebookFrame.minY + 109.9))
      facebookLetterPath.addCurveToPoint(CGPointMake(facebookFrame.minX + 82.71, facebookFrame.minY + 103.12), controlPoint1: CGPointMake(facebookFrame.minX + 71.4, facebookFrame.minY + 103.95), controlPoint2: CGPointMake(facebookFrame.minX + 75.43, facebookFrame.minY + 103.12))
      facebookLetterPath.addCurveToPoint(CGPointMake(facebookFrame.minX + 95.5, facebookFrame.minY + 103.12), controlPoint1: CGPointMake(facebookFrame.minX + 85.34, facebookFrame.minY + 103.12), controlPoint2: CGPointMake(facebookFrame.minX + 93.86, facebookFrame.minY + 102.86))
      facebookLetterPath.addLineToPoint(CGPointMake(facebookFrame.minX + 95.5, facebookFrame.minY + 113.79))
      facebookLetterPath.closePath()
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, textShadowOffset, textShadowBlurRadius, textShadow.CGColor)
      fillColor.setFill()
      facebookLetterPath.fill()
      CGContextRestoreGState(context)

      fillColor.setStroke()
      facebookLetterPath.lineWidth = 1
      facebookLetterPath.stroke()
    }

  }

  private func drawTwitterShare(state: UIControlState) {
    //// General Declarations
    let context = UIGraphicsGetCurrentContext()

    //// Color Declarations
    let twitterFrame = CGRectMake(0, 0, 150, 290)
    let twitterColor = UIColor(red: 0.604, green: 0.894, blue: 0.910, alpha: 1.000)
    let shadowColor2 = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
    let fillColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)

    //// Shadow Declarations
    let buttonShadow = shadowColor2.colorWithAlphaComponent(0.67)
    let buttonShadowOffset = CGSizeMake(0.1, -0.1)
    let buttonShadowBlurRadius: CGFloat = 7
    let textShadow = fillColor
    let textShadowOffset = CGSizeMake(0.1, -0.1)
    let textShadowBlurRadius: CGFloat = 5

    //// Twitter Case Drawing
    var twitterCasePath = UIBezierPath()
    twitterCasePath.moveToPoint(CGPointMake(twitterFrame.minX + 55.22, twitterFrame.minY + 109.02))
    twitterCasePath.addCurveToPoint(CGPointMake(twitterFrame.minX + 53, twitterFrame.minY + 115.27), controlPoint1: CGPointMake(twitterFrame.minX + 53.35, twitterFrame.minY + 110.72), controlPoint2: CGPointMake(twitterFrame.minX + 53, twitterFrame.minY + 115.27))
    twitterCasePath.addLineToPoint(CGPointMake(twitterFrame.minX + 53, twitterFrame.minY + 150.58))
    twitterCasePath.addCurveToPoint(CGPointMake(twitterFrame.minX + 71.58, twitterFrame.minY + 170.44), controlPoint1: CGPointMake(twitterFrame.minX + 53, twitterFrame.minY + 150.58), controlPoint2: CGPointMake(twitterFrame.minX + 53.26, twitterFrame.minY + 167.41))
    twitterCasePath.addLineToPoint(CGPointMake(twitterFrame.minX + 91.46, twitterFrame.minY + 170.44))
    twitterCasePath.addCurveToPoint(CGPointMake(twitterFrame.minX + 96.08, twitterFrame.minY + 168.1), controlPoint1: CGPointMake(twitterFrame.minX + 93.13, twitterFrame.minY + 170.44), controlPoint2: CGPointMake(twitterFrame.minX + 94.81, twitterFrame.minY + 169.66))
    twitterCasePath.addCurveToPoint(CGPointMake(twitterFrame.minX + 96.08, twitterFrame.minY + 156.78), controlPoint1: CGPointMake(twitterFrame.minX + 98.64, twitterFrame.minY + 164.97), controlPoint2: CGPointMake(twitterFrame.minX + 98.64, twitterFrame.minY + 159.91))
    twitterCasePath.addCurveToPoint(CGPointMake(twitterFrame.minX + 91.46, twitterFrame.minY + 154.44), controlPoint1: CGPointMake(twitterFrame.minX + 94.81, twitterFrame.minY + 155.22), controlPoint2: CGPointMake(twitterFrame.minX + 93.13, twitterFrame.minY + 154.44))
    twitterCasePath.addLineToPoint(CGPointMake(twitterFrame.minX + 73.64, twitterFrame.minY + 154.44))
    twitterCasePath.addCurveToPoint(CGPointMake(twitterFrame.minX + 68.17, twitterFrame.minY + 141.2), controlPoint1: CGPointMake(twitterFrame.minX + 71.65, twitterFrame.minY + 153.4), controlPoint2: CGPointMake(twitterFrame.minX + 67.39, twitterFrame.minY + 153.61))
    twitterCasePath.addLineToPoint(CGPointMake(twitterFrame.minX + 89.89, twitterFrame.minY + 141.2))
    twitterCasePath.addCurveToPoint(CGPointMake(twitterFrame.minX + 94.25, twitterFrame.minY + 139.02), controlPoint1: CGPointMake(twitterFrame.minX + 91.48, twitterFrame.minY + 141.12), controlPoint2: CGPointMake(twitterFrame.minX + 93.04, twitterFrame.minY + 140.4))
    twitterCasePath.addCurveToPoint(CGPointMake(twitterFrame.minX + 94.25, twitterFrame.minY + 128.49), controlPoint1: CGPointMake(twitterFrame.minX + 96.81, twitterFrame.minY + 136.11), controlPoint2: CGPointMake(twitterFrame.minX + 96.81, twitterFrame.minY + 131.4))
    twitterCasePath.addCurveToPoint(CGPointMake(twitterFrame.minX + 89.89, twitterFrame.minY + 126.31), controlPoint1: CGPointMake(twitterFrame.minX + 93.04, twitterFrame.minY + 127.11), controlPoint2: CGPointMake(twitterFrame.minX + 91.48, twitterFrame.minY + 126.39))
    twitterCasePath.addLineToPoint(CGPointMake(twitterFrame.minX + 68.17, twitterFrame.minY + 126.31))
    twitterCasePath.addCurveToPoint(CGPointMake(twitterFrame.minX + 68.17, twitterFrame.minY + 115.27), controlPoint1: CGPointMake(twitterFrame.minX + 68.17, twitterFrame.minY + 120.17), controlPoint2: CGPointMake(twitterFrame.minX + 68.17, twitterFrame.minY + 115.27))
    twitterCasePath.addCurveToPoint(CGPointMake(twitterFrame.minX + 65.95, twitterFrame.minY + 109.02), controlPoint1: CGPointMake(twitterFrame.minX + 68.17, twitterFrame.minY + 115.27), controlPoint2: CGPointMake(twitterFrame.minX + 67.82, twitterFrame.minY + 110.72))
    twitterCasePath.addCurveToPoint(CGPointMake(twitterFrame.minX + 55.22, twitterFrame.minY + 109.02), controlPoint1: CGPointMake(twitterFrame.minX + 62.99, twitterFrame.minY + 106.33), controlPoint2: CGPointMake(twitterFrame.minX + 58.19, twitterFrame.minY + 106.33))
    twitterCasePath.closePath()
    twitterCasePath.moveToPoint(CGPointMake(twitterFrame.minX + 136, twitterFrame.minY + 0))
    twitterCasePath.addCurveToPoint(CGPointMake(twitterFrame.minX + 136, twitterFrame.minY + 62.3), controlPoint1: CGPointMake(twitterFrame.minX + 136, twitterFrame.minY), controlPoint2: CGPointMake(twitterFrame.minX + 136, twitterFrame.minY + 62.3))
    twitterCasePath.addLineToPoint(CGPointMake(twitterFrame.minX + 136, twitterFrame.minY + 282))
    twitterCasePath.addLineToPoint(CGPointMake(twitterFrame.minX + 75, twitterFrame.minY + 210.11))
    twitterCasePath.addLineToPoint(CGPointMake(twitterFrame.minX + 15.09, twitterFrame.minY + 282))
    twitterCasePath.addLineToPoint(CGPointMake(twitterFrame.minX + 14, twitterFrame.minY + 62.3))
    twitterCasePath.addLineToPoint(CGPointMake(twitterFrame.minX + 14, twitterFrame.minY))
    twitterCasePath.addLineToPoint(CGPointMake(twitterFrame.minX + 136, twitterFrame.minY))
    twitterCasePath.addLineToPoint(CGPointMake(twitterFrame.minX + 136, twitterFrame.minY + 0))
    twitterCasePath.closePath()
    CGContextSaveGState(context)
    CGContextSetShadowWithColor(context, buttonShadowOffset, buttonShadowBlurRadius, buttonShadow.CGColor)
    twitterColor.setFill()
    twitterCasePath.fill()
    CGContextRestoreGState(context)


    if (state == .Normal) {
      //// Twitter Letter Drawing
      var twitterLetterPath = UIBezierPath()
      twitterLetterPath.moveToPoint(CGPointMake(twitterFrame.minX + 74, twitterFrame.minY + 154))
      twitterLetterPath.addLineToPoint(CGPointMake(twitterFrame.minX + 92, twitterFrame.minY + 154))
      twitterLetterPath.addCurveToPoint(CGPointMake(twitterFrame.minX + 97.04, twitterFrame.minY + 157.34), controlPoint1: CGPointMake(twitterFrame.minX + 93.71, twitterFrame.minY + 154), controlPoint2: CGPointMake(twitterFrame.minX + 95.74, twitterFrame.minY + 155.73))
      twitterLetterPath.addCurveToPoint(CGPointMake(twitterFrame.minX + 97.04, twitterFrame.minY + 169.01), controlPoint1: CGPointMake(twitterFrame.minX + 99.65, twitterFrame.minY + 160.56), controlPoint2: CGPointMake(twitterFrame.minX + 99.65, twitterFrame.minY + 165.78))
      twitterLetterPath.addCurveToPoint(CGPointMake(twitterFrame.minX + 92.31, twitterFrame.minY + 171.42), controlPoint1: CGPointMake(twitterFrame.minX + 95.74, twitterFrame.minY + 170.62), controlPoint2: CGPointMake(twitterFrame.minX + 94.03, twitterFrame.minY + 171.42))
      twitterLetterPath.addLineToPoint(CGPointMake(twitterFrame.minX + 71.99, twitterFrame.minY + 171.42))
      twitterLetterPath.addCurveToPoint(CGPointMake(twitterFrame.minX + 71.99, twitterFrame.minY + 171.42), controlPoint1: CGPointMake(twitterFrame.minX + 71.99, twitterFrame.minY + 171.42), controlPoint2: CGPointMake(twitterFrame.minX + 71.99, twitterFrame.minY + 172.72))
      twitterLetterPath.addCurveToPoint(CGPointMake(twitterFrame.minX + 53, twitterFrame.minY + 150.94), controlPoint1: CGPointMake(twitterFrame.minX + 53.27, twitterFrame.minY + 168.29), controlPoint2: CGPointMake(twitterFrame.minX + 53, twitterFrame.minY + 150.94))
      twitterLetterPath.addLineToPoint(CGPointMake(twitterFrame.minX + 53, twitterFrame.minY + 114.53))
      twitterLetterPath.addCurveToPoint(CGPointMake(twitterFrame.minX + 55.27, twitterFrame.minY + 108.08), controlPoint1: CGPointMake(twitterFrame.minX + 53, twitterFrame.minY + 114.53), controlPoint2: CGPointMake(twitterFrame.minX + 53.36, twitterFrame.minY + 109.84))
      twitterLetterPath.addCurveToPoint(CGPointMake(twitterFrame.minX + 66.24, twitterFrame.minY + 108.08), controlPoint1: CGPointMake(twitterFrame.minX + 58.3, twitterFrame.minY + 105.31), controlPoint2: CGPointMake(twitterFrame.minX + 63.21, twitterFrame.minY + 105.31))
      twitterLetterPath.addCurveToPoint(CGPointMake(twitterFrame.minX + 68.51, twitterFrame.minY + 114.53), controlPoint1: CGPointMake(twitterFrame.minX + 68.15, twitterFrame.minY + 109.84), controlPoint2: CGPointMake(twitterFrame.minX + 68.51, twitterFrame.minY + 114.53))
      twitterLetterPath.addCurveToPoint(CGPointMake(twitterFrame.minX + 68.51, twitterFrame.minY + 125.91), controlPoint1: CGPointMake(twitterFrame.minX + 68.51, twitterFrame.minY + 114.53), controlPoint2: CGPointMake(twitterFrame.minX + 68.51, twitterFrame.minY + 119.58))
      twitterLetterPath.addLineToPoint(CGPointMake(twitterFrame.minX + 90.71, twitterFrame.minY + 125.91))
      twitterLetterPath.addCurveToPoint(CGPointMake(twitterFrame.minX + 95.17, twitterFrame.minY + 128.16), controlPoint1: CGPointMake(twitterFrame.minX + 92.33, twitterFrame.minY + 125.99), controlPoint2: CGPointMake(twitterFrame.minX + 93.93, twitterFrame.minY + 126.74))
      twitterLetterPath.addCurveToPoint(CGPointMake(twitterFrame.minX + 95.17, twitterFrame.minY + 139.02), controlPoint1: CGPointMake(twitterFrame.minX + 97.78, twitterFrame.minY + 131.16), controlPoint2: CGPointMake(twitterFrame.minX + 97.78, twitterFrame.minY + 136.02))
      twitterLetterPath.addCurveToPoint(CGPointMake(twitterFrame.minX + 91, twitterFrame.minY + 141.5), controlPoint1: CGPointMake(twitterFrame.minX + 93.93, twitterFrame.minY + 140.44), controlPoint2: CGPointMake(twitterFrame.minX + 92.62, twitterFrame.minY + 141.43))
      twitterLetterPath.addLineToPoint(CGPointMake(twitterFrame.minX + 69, twitterFrame.minY + 141.5))
      twitterLetterPath.addCurveToPoint(CGPointMake(twitterFrame.minX + 74, twitterFrame.minY + 154), controlPoint1: CGPointMake(twitterFrame.minX + 68.2, twitterFrame.minY + 154.3), controlPoint2: CGPointMake(twitterFrame.minX + 71.97, twitterFrame.minY + 152.92))
      twitterLetterPath.closePath()
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, textShadowOffset, textShadowBlurRadius, textShadow.CGColor)
      fillColor.setFill()
      twitterLetterPath.fill()
      CGContextRestoreGState(context)
    }
  }

  private func drawFacebookScore(state: UIControlState) {
    let scoreFrame = CGRectMake(0, 0, 95, 95)
    var facebookColor: UIColor?
    switch state {
    case UIControlState.Normal:
      facebookColor = UIColor(red: 0.255, green: 0.369, blue: 0.608, alpha: 1.000)
    case UIControlState.Highlighted:
      facebookColor = UIColor(red: 0.800, green: 0.616, blue: 0.153, alpha: 1.000)
    default:
      println("Error")
    }
    //// Facebook Letter 2 Drawing
    var facebookLetterPath = UIBezierPath()
    facebookLetterPath.moveToPoint(CGPointMake(scoreFrame.minX + 70.5, scoreFrame.minY + 26.19))
    facebookLetterPath.addCurveToPoint(CGPointMake(scoreFrame.minX + 60.98, scoreFrame.minY + 26.29), controlPoint1: CGPointMake(scoreFrame.minX + 70.5, scoreFrame.minY + 26.19), controlPoint2: CGPointMake(scoreFrame.minX + 62.61, scoreFrame.minY + 26.29))
    facebookLetterPath.addCurveToPoint(CGPointMake(scoreFrame.minX + 54.35, scoreFrame.minY + 28.14), controlPoint1: CGPointMake(scoreFrame.minX + 57.07, scoreFrame.minY + 26.29), controlPoint2: CGPointMake(scoreFrame.minX + 55.73, scoreFrame.minY + 27.2))
    facebookLetterPath.addCurveToPoint(CGPointMake(scoreFrame.minX + 53.28, scoreFrame.minY + 35.72), controlPoint1: CGPointMake(scoreFrame.minX + 52.96, scoreFrame.minY + 29.07), controlPoint2: CGPointMake(scoreFrame.minX + 53.28, scoreFrame.minY + 33.03))
    facebookLetterPath.addLineToPoint(CGPointMake(scoreFrame.minX + 53.28, scoreFrame.minY + 36.05))
    facebookLetterPath.addLineToPoint(CGPointMake(scoreFrame.minX + 68.66, scoreFrame.minY + 36.05))
    facebookLetterPath.addLineToPoint(CGPointMake(scoreFrame.minX + 68.66, scoreFrame.minY + 45.05))
    facebookLetterPath.addLineToPoint(CGPointMake(scoreFrame.minX + 53.94, scoreFrame.minY + 45.05))
    facebookLetterPath.addLineToPoint(CGPointMake(scoreFrame.minX + 53.94, scoreFrame.minY + 77.5))
    facebookLetterPath.addLineToPoint(CGPointMake(scoreFrame.minX + 34.02, scoreFrame.minY + 77.5))
    facebookLetterPath.addLineToPoint(CGPointMake(scoreFrame.minX + 34.02, scoreFrame.minY + 45.05))
    facebookLetterPath.addLineToPoint(CGPointMake(scoreFrame.minX + 25.5, scoreFrame.minY + 45.05))
    facebookLetterPath.addLineToPoint(CGPointMake(scoreFrame.minX + 25.5, scoreFrame.minY + 36.05))
    facebookLetterPath.addLineToPoint(CGPointMake(scoreFrame.minX + 34.02, scoreFrame.minY + 36.05))
    facebookLetterPath.addLineToPoint(CGPointMake(scoreFrame.minX + 33.58, scoreFrame.minY + 31.39))
    facebookLetterPath.addCurveToPoint(CGPointMake(scoreFrame.minX + 39.35, scoreFrame.minY + 20.35), controlPoint1: CGPointMake(scoreFrame.minX + 33.58, scoreFrame.minY + 26.32), controlPoint2: CGPointMake(scoreFrame.minX + 35.31, scoreFrame.minY + 22.88))
    facebookLetterPath.addCurveToPoint(CGPointMake(scoreFrame.minX + 56.11, scoreFrame.minY + 17.1), controlPoint1: CGPointMake(scoreFrame.minX + 43.39, scoreFrame.minY + 17.81), controlPoint2: CGPointMake(scoreFrame.minX + 47.93, scoreFrame.minY + 17.1))
    facebookLetterPath.addCurveToPoint(CGPointMake(scoreFrame.minX + 70.5, scoreFrame.minY + 17.1), controlPoint1: CGPointMake(scoreFrame.minX + 59.07, scoreFrame.minY + 17.1), controlPoint2: CGPointMake(scoreFrame.minX + 68.66, scoreFrame.minY + 16.88))
    facebookLetterPath.addLineToPoint(CGPointMake(scoreFrame.minX + 70.5, scoreFrame.minY + 26.19))
    facebookLetterPath.closePath()
    facebookColor!.setFill()
    facebookLetterPath.fill()
  }

  private func drawTwitterScore(state: UIControlState) {
    let scoreFrame = CGRectMake(0, 0, 95, 95)
    var twitterColor: UIColor?
    switch state {
    case UIControlState.Normal:
      twitterColor = UIColor(red: 0.604, green: 0.894, blue: 0.910, alpha: 1.000)
    case UIControlState.Highlighted:
      twitterColor = UIColor(red: 0.800, green: 0.616, blue: 0.153, alpha: 1.000)
    default:
      println("Error")
    }

    //// Twitter Letter 2 Drawing
    var twitterLetterPath = UIBezierPath()
    twitterLetterPath.moveToPoint(CGPointMake(scoreFrame.minX + 45.54, scoreFrame.minY + 61.36))
    twitterLetterPath.addLineToPoint(CGPointMake(scoreFrame.minX + 63.15, scoreFrame.minY + 61.36))
    twitterLetterPath.addCurveToPoint(CGPointMake(scoreFrame.minX + 68.08, scoreFrame.minY + 64.45), controlPoint1: CGPointMake(scoreFrame.minX + 64.83, scoreFrame.minY + 61.36), controlPoint2: CGPointMake(scoreFrame.minX + 66.81, scoreFrame.minY + 62.96))
    twitterLetterPath.addCurveToPoint(CGPointMake(scoreFrame.minX + 68.08, scoreFrame.minY + 75.23), controlPoint1: CGPointMake(scoreFrame.minX + 70.64, scoreFrame.minY + 67.43), controlPoint2: CGPointMake(scoreFrame.minX + 70.64, scoreFrame.minY + 72.26))
    twitterLetterPath.addCurveToPoint(CGPointMake(scoreFrame.minX + 63.46, scoreFrame.minY + 77.47), controlPoint1: CGPointMake(scoreFrame.minX + 66.81, scoreFrame.minY + 76.72), controlPoint2: CGPointMake(scoreFrame.minX + 65.13, scoreFrame.minY + 77.47))
    twitterLetterPath.addLineToPoint(CGPointMake(scoreFrame.minX + 43.58, scoreFrame.minY + 77.47))
    twitterLetterPath.addCurveToPoint(CGPointMake(scoreFrame.minX + 43.58, scoreFrame.minY + 77.47), controlPoint1: CGPointMake(scoreFrame.minX + 43.58, scoreFrame.minY + 77.47), controlPoint2: CGPointMake(scoreFrame.minX + 43.58, scoreFrame.minY + 78.67))
    twitterLetterPath.addCurveToPoint(CGPointMake(scoreFrame.minX + 25, scoreFrame.minY + 58.54), controlPoint1: CGPointMake(scoreFrame.minX + 25.26, scoreFrame.minY + 74.57), controlPoint2: CGPointMake(scoreFrame.minX + 25, scoreFrame.minY + 58.54))
    twitterLetterPath.addLineToPoint(CGPointMake(scoreFrame.minX + 25, scoreFrame.minY + 24.89))
    twitterLetterPath.addCurveToPoint(CGPointMake(scoreFrame.minX + 27.22, scoreFrame.minY + 18.93), controlPoint1: CGPointMake(scoreFrame.minX + 25, scoreFrame.minY + 24.89), controlPoint2: CGPointMake(scoreFrame.minX + 25.35, scoreFrame.minY + 20.54))
    twitterLetterPath.addCurveToPoint(CGPointMake(scoreFrame.minX + 37.95, scoreFrame.minY + 18.93), controlPoint1: CGPointMake(scoreFrame.minX + 30.19, scoreFrame.minY + 16.36), controlPoint2: CGPointMake(scoreFrame.minX + 34.99, scoreFrame.minY + 16.36))
    twitterLetterPath.addCurveToPoint(CGPointMake(scoreFrame.minX + 40.17, scoreFrame.minY + 24.89), controlPoint1: CGPointMake(scoreFrame.minX + 39.82, scoreFrame.minY + 20.54), controlPoint2: CGPointMake(scoreFrame.minX + 40.17, scoreFrame.minY + 24.89))
    twitterLetterPath.addCurveToPoint(CGPointMake(scoreFrame.minX + 40.17, scoreFrame.minY + 35.4), controlPoint1: CGPointMake(scoreFrame.minX + 40.17, scoreFrame.minY + 24.89), controlPoint2: CGPointMake(scoreFrame.minX + 40.17, scoreFrame.minY + 29.55))
    twitterLetterPath.addLineToPoint(CGPointMake(scoreFrame.minX + 61.89, scoreFrame.minY + 35.4))
    twitterLetterPath.addCurveToPoint(CGPointMake(scoreFrame.minX + 66.25, scoreFrame.minY + 37.48), controlPoint1: CGPointMake(scoreFrame.minX + 63.48, scoreFrame.minY + 35.48), controlPoint2: CGPointMake(scoreFrame.minX + 65.04, scoreFrame.minY + 36.17))
    twitterLetterPath.addCurveToPoint(CGPointMake(scoreFrame.minX + 66.25, scoreFrame.minY + 47.52), controlPoint1: CGPointMake(scoreFrame.minX + 68.81, scoreFrame.minY + 40.25), controlPoint2: CGPointMake(scoreFrame.minX + 68.81, scoreFrame.minY + 44.75))
    twitterLetterPath.addCurveToPoint(CGPointMake(scoreFrame.minX + 62.17, scoreFrame.minY + 49.81), controlPoint1: CGPointMake(scoreFrame.minX + 65.04, scoreFrame.minY + 48.83), controlPoint2: CGPointMake(scoreFrame.minX + 63.76, scoreFrame.minY + 49.74))
    twitterLetterPath.addLineToPoint(CGPointMake(scoreFrame.minX + 40.65, scoreFrame.minY + 49.81))
    twitterLetterPath.addCurveToPoint(CGPointMake(scoreFrame.minX + 45.54, scoreFrame.minY + 61.36), controlPoint1: CGPointMake(scoreFrame.minX + 39.87, scoreFrame.minY + 61.64), controlPoint2: CGPointMake(scoreFrame.minX + 43.56, scoreFrame.minY + 60.37))
    twitterLetterPath.closePath()
    twitterLetterPath.lineCapStyle = kCGLineCapRound;
    
    twitterLetterPath.lineJoinStyle = kCGLineJoinBevel;
    
    twitterColor!.setFill()
    twitterLetterPath.fill()
    
  }
  
}
