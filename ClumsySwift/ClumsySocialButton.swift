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
      setBackgroundImage(imageForContextShareButton(.LeaderboardMain, state: .Normal), forState: .Normal)
      setBackgroundImage(imageForContextShareButton(.LeaderboardMain, state: .Highlighted), forState: .Highlighted)
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
    //// General Declarations
    let context = UIGraphicsGetCurrentContext()

    //// Color Declarations
    let gradient3Color1 = UIColor(red: 0.990, green: 1.000, blue: 0.000, alpha: 1.000)
    let shadowColor2 = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
    let shadow8Color = UIColor(red: 0.724, green: 0.724, blue: 0.724, alpha: 1.000)
    let color37 = UIColor(red: 0.000, green: 0.915, blue: 1.000, alpha: 1.000)

    //// Shadow Declarations
    let buttonShadow = shadowColor2.colorWithAlphaComponent(0.67)
    let buttonShadowOffset = CGSizeMake(0.1, -0.1)
    let buttonShadowBlurRadius: CGFloat = 7
    let shadow8 = shadow8Color
    let shadow8Offset = CGSizeMake(0.1, -0.1)
    let shadow8BlurRadius: CGFloat = 3

    //// Frames
    let leaderBoardFrame = CGRectMake(0, 0, 150, 290)

    //// LeaderBoard
    //// Bezier 2 Drawing
    var bezier2Path = UIBezierPath()
    bezier2Path.moveToPoint(CGPointMake(leaderBoardFrame.minX + 112.94, leaderBoardFrame.minY + 119))
    bezier2Path.addLineToPoint(CGPointMake(leaderBoardFrame.minX + 94.06, leaderBoardFrame.minY + 119))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 92.26, leaderBoardFrame.minY + 119.15), controlPoint1: CGPointMake(leaderBoardFrame.minX + 93.18, leaderBoardFrame.minY + 119), controlPoint2: CGPointMake(leaderBoardFrame.minX + 92.74, leaderBoardFrame.minY + 119))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 91.15, leaderBoardFrame.minY + 120.26), controlPoint1: CGPointMake(leaderBoardFrame.minX + 91.75, leaderBoardFrame.minY + 119.34), controlPoint2: CGPointMake(leaderBoardFrame.minX + 91.34, leaderBoardFrame.minY + 119.75))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 91, leaderBoardFrame.minY + 122.06), controlPoint1: CGPointMake(leaderBoardFrame.minX + 91, leaderBoardFrame.minY + 120.74), controlPoint2: CGPointMake(leaderBoardFrame.minX + 91, leaderBoardFrame.minY + 121.18))
    bezier2Path.addLineToPoint(CGPointMake(leaderBoardFrame.minX + 91, leaderBoardFrame.minY + 159.94))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 91.15, leaderBoardFrame.minY + 161.74), controlPoint1: CGPointMake(leaderBoardFrame.minX + 91, leaderBoardFrame.minY + 160.82), controlPoint2: CGPointMake(leaderBoardFrame.minX + 91, leaderBoardFrame.minY + 161.26))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 92.26, leaderBoardFrame.minY + 162.85), controlPoint1: CGPointMake(leaderBoardFrame.minX + 91.34, leaderBoardFrame.minY + 162.25), controlPoint2: CGPointMake(leaderBoardFrame.minX + 91.75, leaderBoardFrame.minY + 162.66))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 94.06, leaderBoardFrame.minY + 163), controlPoint1: CGPointMake(leaderBoardFrame.minX + 92.74, leaderBoardFrame.minY + 163), controlPoint2: CGPointMake(leaderBoardFrame.minX + 93.18, leaderBoardFrame.minY + 163))
    bezier2Path.addLineToPoint(CGPointMake(leaderBoardFrame.minX + 112.94, leaderBoardFrame.minY + 163))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 114.74, leaderBoardFrame.minY + 162.85), controlPoint1: CGPointMake(leaderBoardFrame.minX + 113.82, leaderBoardFrame.minY + 163), controlPoint2: CGPointMake(leaderBoardFrame.minX + 114.26, leaderBoardFrame.minY + 163))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 115.85, leaderBoardFrame.minY + 161.74), controlPoint1: CGPointMake(leaderBoardFrame.minX + 115.25, leaderBoardFrame.minY + 162.66), controlPoint2: CGPointMake(leaderBoardFrame.minX + 115.66, leaderBoardFrame.minY + 162.25))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 116, leaderBoardFrame.minY + 159.94), controlPoint1: CGPointMake(leaderBoardFrame.minX + 116, leaderBoardFrame.minY + 161.26), controlPoint2: CGPointMake(leaderBoardFrame.minX + 116, leaderBoardFrame.minY + 160.82))
    bezier2Path.addLineToPoint(CGPointMake(leaderBoardFrame.minX + 116, leaderBoardFrame.minY + 122.06))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 115.85, leaderBoardFrame.minY + 120.26), controlPoint1: CGPointMake(leaderBoardFrame.minX + 116, leaderBoardFrame.minY + 121.18), controlPoint2: CGPointMake(leaderBoardFrame.minX + 116, leaderBoardFrame.minY + 120.74))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 114.74, leaderBoardFrame.minY + 119.15), controlPoint1: CGPointMake(leaderBoardFrame.minX + 115.66, leaderBoardFrame.minY + 119.75), controlPoint2: CGPointMake(leaderBoardFrame.minX + 115.25, leaderBoardFrame.minY + 119.34))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 112.94, leaderBoardFrame.minY + 119), controlPoint1: CGPointMake(leaderBoardFrame.minX + 114.26, leaderBoardFrame.minY + 119), controlPoint2: CGPointMake(leaderBoardFrame.minX + 113.82, leaderBoardFrame.minY + 119))
    bezier2Path.closePath()
    bezier2Path.moveToPoint(CGPointMake(leaderBoardFrame.minX + 85.94, leaderBoardFrame.minY + 99))
    bezier2Path.addLineToPoint(CGPointMake(leaderBoardFrame.minX + 66.06, leaderBoardFrame.minY + 99))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 64.26, leaderBoardFrame.minY + 99.15), controlPoint1: CGPointMake(leaderBoardFrame.minX + 65.18, leaderBoardFrame.minY + 99), controlPoint2: CGPointMake(leaderBoardFrame.minX + 64.74, leaderBoardFrame.minY + 99))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 63.15, leaderBoardFrame.minY + 100.26), controlPoint1: CGPointMake(leaderBoardFrame.minX + 63.75, leaderBoardFrame.minY + 99.34), controlPoint2: CGPointMake(leaderBoardFrame.minX + 63.34, leaderBoardFrame.minY + 99.75))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 63, leaderBoardFrame.minY + 102.06), controlPoint1: CGPointMake(leaderBoardFrame.minX + 63, leaderBoardFrame.minY + 100.74), controlPoint2: CGPointMake(leaderBoardFrame.minX + 63, leaderBoardFrame.minY + 101.18))
    bezier2Path.addLineToPoint(CGPointMake(leaderBoardFrame.minX + 63, leaderBoardFrame.minY + 159.94))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 63.15, leaderBoardFrame.minY + 161.74), controlPoint1: CGPointMake(leaderBoardFrame.minX + 63, leaderBoardFrame.minY + 160.82), controlPoint2: CGPointMake(leaderBoardFrame.minX + 63, leaderBoardFrame.minY + 161.26))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 64.26, leaderBoardFrame.minY + 162.85), controlPoint1: CGPointMake(leaderBoardFrame.minX + 63.34, leaderBoardFrame.minY + 162.25), controlPoint2: CGPointMake(leaderBoardFrame.minX + 63.75, leaderBoardFrame.minY + 162.66))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 66.06, leaderBoardFrame.minY + 163), controlPoint1: CGPointMake(leaderBoardFrame.minX + 64.74, leaderBoardFrame.minY + 163), controlPoint2: CGPointMake(leaderBoardFrame.minX + 65.18, leaderBoardFrame.minY + 163))
    bezier2Path.addLineToPoint(CGPointMake(leaderBoardFrame.minX + 85.94, leaderBoardFrame.minY + 163))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 87.74, leaderBoardFrame.minY + 162.85), controlPoint1: CGPointMake(leaderBoardFrame.minX + 86.82, leaderBoardFrame.minY + 163), controlPoint2: CGPointMake(leaderBoardFrame.minX + 87.26, leaderBoardFrame.minY + 163))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 88.85, leaderBoardFrame.minY + 161.74), controlPoint1: CGPointMake(leaderBoardFrame.minX + 88.25, leaderBoardFrame.minY + 162.66), controlPoint2: CGPointMake(leaderBoardFrame.minX + 88.66, leaderBoardFrame.minY + 162.25))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 89, leaderBoardFrame.minY + 159.94), controlPoint1: CGPointMake(leaderBoardFrame.minX + 89, leaderBoardFrame.minY + 161.26), controlPoint2: CGPointMake(leaderBoardFrame.minX + 89, leaderBoardFrame.minY + 160.82))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 89, leaderBoardFrame.minY + 112.7), controlPoint1: CGPointMake(leaderBoardFrame.minX + 89, leaderBoardFrame.minY + 159.94), controlPoint2: CGPointMake(leaderBoardFrame.minX + 89, leaderBoardFrame.minY + 129.42))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 89, leaderBoardFrame.minY + 102.06), controlPoint1: CGPointMake(leaderBoardFrame.minX + 89, leaderBoardFrame.minY + 106.4), controlPoint2: CGPointMake(leaderBoardFrame.minX + 89, leaderBoardFrame.minY + 102.06))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 88.85, leaderBoardFrame.minY + 100.26), controlPoint1: CGPointMake(leaderBoardFrame.minX + 89, leaderBoardFrame.minY + 101.18), controlPoint2: CGPointMake(leaderBoardFrame.minX + 89, leaderBoardFrame.minY + 100.74))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 87.74, leaderBoardFrame.minY + 99.15), controlPoint1: CGPointMake(leaderBoardFrame.minX + 88.66, leaderBoardFrame.minY + 99.75), controlPoint2: CGPointMake(leaderBoardFrame.minX + 88.25, leaderBoardFrame.minY + 99.34))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 85.94, leaderBoardFrame.minY + 99), controlPoint1: CGPointMake(leaderBoardFrame.minX + 87.26, leaderBoardFrame.minY + 99), controlPoint2: CGPointMake(leaderBoardFrame.minX + 86.82, leaderBoardFrame.minY + 99))
    bezier2Path.closePath()
    bezier2Path.moveToPoint(CGPointMake(leaderBoardFrame.minX + 57.94, leaderBoardFrame.minY + 137))
    bezier2Path.addLineToPoint(CGPointMake(leaderBoardFrame.minX + 39.06, leaderBoardFrame.minY + 137))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 37.26, leaderBoardFrame.minY + 137.15), controlPoint1: CGPointMake(leaderBoardFrame.minX + 38.18, leaderBoardFrame.minY + 137), controlPoint2: CGPointMake(leaderBoardFrame.minX + 37.74, leaderBoardFrame.minY + 137))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 36.15, leaderBoardFrame.minY + 138.26), controlPoint1: CGPointMake(leaderBoardFrame.minX + 36.75, leaderBoardFrame.minY + 137.34), controlPoint2: CGPointMake(leaderBoardFrame.minX + 36.34, leaderBoardFrame.minY + 137.75))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 36, leaderBoardFrame.minY + 140.06), controlPoint1: CGPointMake(leaderBoardFrame.minX + 36, leaderBoardFrame.minY + 138.74), controlPoint2: CGPointMake(leaderBoardFrame.minX + 36, leaderBoardFrame.minY + 139.18))
    bezier2Path.addLineToPoint(CGPointMake(leaderBoardFrame.minX + 36, leaderBoardFrame.minY + 159.94))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 36.15, leaderBoardFrame.minY + 161.74), controlPoint1: CGPointMake(leaderBoardFrame.minX + 36, leaderBoardFrame.minY + 160.82), controlPoint2: CGPointMake(leaderBoardFrame.minX + 36, leaderBoardFrame.minY + 161.26))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 37.26, leaderBoardFrame.minY + 162.85), controlPoint1: CGPointMake(leaderBoardFrame.minX + 36.34, leaderBoardFrame.minY + 162.25), controlPoint2: CGPointMake(leaderBoardFrame.minX + 36.75, leaderBoardFrame.minY + 162.66))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 39.06, leaderBoardFrame.minY + 163), controlPoint1: CGPointMake(leaderBoardFrame.minX + 37.74, leaderBoardFrame.minY + 163), controlPoint2: CGPointMake(leaderBoardFrame.minX + 38.18, leaderBoardFrame.minY + 163))
    bezier2Path.addLineToPoint(CGPointMake(leaderBoardFrame.minX + 57.94, leaderBoardFrame.minY + 163))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 59.74, leaderBoardFrame.minY + 162.85), controlPoint1: CGPointMake(leaderBoardFrame.minX + 58.82, leaderBoardFrame.minY + 163), controlPoint2: CGPointMake(leaderBoardFrame.minX + 59.26, leaderBoardFrame.minY + 163))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 60.85, leaderBoardFrame.minY + 161.74), controlPoint1: CGPointMake(leaderBoardFrame.minX + 60.25, leaderBoardFrame.minY + 162.66), controlPoint2: CGPointMake(leaderBoardFrame.minX + 60.66, leaderBoardFrame.minY + 162.25))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 61, leaderBoardFrame.minY + 159.94), controlPoint1: CGPointMake(leaderBoardFrame.minX + 61, leaderBoardFrame.minY + 161.26), controlPoint2: CGPointMake(leaderBoardFrame.minX + 61, leaderBoardFrame.minY + 160.82))
    bezier2Path.addLineToPoint(CGPointMake(leaderBoardFrame.minX + 61, leaderBoardFrame.minY + 140.06))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 60.85, leaderBoardFrame.minY + 138.26), controlPoint1: CGPointMake(leaderBoardFrame.minX + 61, leaderBoardFrame.minY + 139.18), controlPoint2: CGPointMake(leaderBoardFrame.minX + 61, leaderBoardFrame.minY + 138.74))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 59.74, leaderBoardFrame.minY + 137.15), controlPoint1: CGPointMake(leaderBoardFrame.minX + 60.66, leaderBoardFrame.minY + 137.75), controlPoint2: CGPointMake(leaderBoardFrame.minX + 60.25, leaderBoardFrame.minY + 137.34))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 57.94, leaderBoardFrame.minY + 137), controlPoint1: CGPointMake(leaderBoardFrame.minX + 59.26, leaderBoardFrame.minY + 137), controlPoint2: CGPointMake(leaderBoardFrame.minX + 58.82, leaderBoardFrame.minY + 137))
    bezier2Path.closePath()
    bezier2Path.moveToPoint(CGPointMake(leaderBoardFrame.minX + 127, leaderBoardFrame.minY + 0))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 127, leaderBoardFrame.minY + 58.33), controlPoint1: CGPointMake(leaderBoardFrame.minX + 127, leaderBoardFrame.minY), controlPoint2: CGPointMake(leaderBoardFrame.minX + 127, leaderBoardFrame.minY + 58.33))
    bezier2Path.addLineToPoint(CGPointMake(leaderBoardFrame.minX + 127, leaderBoardFrame.minY + 264))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 117.46, leaderBoardFrame.minY + 251.66), controlPoint1: CGPointMake(leaderBoardFrame.minX + 127, leaderBoardFrame.minY + 264), controlPoint2: CGPointMake(leaderBoardFrame.minX + 123.11, leaderBoardFrame.minY + 258.97))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 75, leaderBoardFrame.minY + 196.7), controlPoint1: CGPointMake(leaderBoardFrame.minX + 102.45, leaderBoardFrame.minY + 232.23), controlPoint2: CGPointMake(leaderBoardFrame.minX + 75, leaderBoardFrame.minY + 196.7))
    bezier2Path.addLineToPoint(CGPointMake(leaderBoardFrame.minX + 23.93, leaderBoardFrame.minY + 264))
    bezier2Path.addLineToPoint(CGPointMake(leaderBoardFrame.minX + 23, leaderBoardFrame.minY + 58.33))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 23, leaderBoardFrame.minY + 34.51), controlPoint1: CGPointMake(leaderBoardFrame.minX + 23, leaderBoardFrame.minY + 58.33), controlPoint2: CGPointMake(leaderBoardFrame.minX + 23, leaderBoardFrame.minY + 47.11))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 23, leaderBoardFrame.minY + 29.12), controlPoint1: CGPointMake(leaderBoardFrame.minX + 23, leaderBoardFrame.minY + 32.73), controlPoint2: CGPointMake(leaderBoardFrame.minX + 23, leaderBoardFrame.minY + 30.93))
    bezier2Path.addLineToPoint(CGPointMake(leaderBoardFrame.minX + 23, leaderBoardFrame.minY + 28.38))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 23, leaderBoardFrame.minY + 0), controlPoint1: CGPointMake(leaderBoardFrame.minX + 23, leaderBoardFrame.minY + 14.17), controlPoint2: CGPointMake(leaderBoardFrame.minX + 23, leaderBoardFrame.minY + 0.21))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 23.23, leaderBoardFrame.minY + 0), controlPoint1: CGPointMake(leaderBoardFrame.minX + 23, leaderBoardFrame.minY + 0), controlPoint2: CGPointMake(leaderBoardFrame.minX + 23.08, leaderBoardFrame.minY + 0))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 94.66, leaderBoardFrame.minY), controlPoint1: CGPointMake(leaderBoardFrame.minX + 26.56, leaderBoardFrame.minY + 0), controlPoint2: CGPointMake(leaderBoardFrame.minX + 65.46, leaderBoardFrame.minY + 0))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 121.11, leaderBoardFrame.minY), controlPoint1: CGPointMake(leaderBoardFrame.minX + 105.66, leaderBoardFrame.minY), controlPoint2: CGPointMake(leaderBoardFrame.minX + 115.28, leaderBoardFrame.minY))
    bezier2Path.addCurveToPoint(CGPointMake(leaderBoardFrame.minX + 127, leaderBoardFrame.minY), controlPoint1: CGPointMake(leaderBoardFrame.minX + 124.83, leaderBoardFrame.minY), controlPoint2: CGPointMake(leaderBoardFrame.minX + 127, leaderBoardFrame.minY))
    bezier2Path.addLineToPoint(CGPointMake(leaderBoardFrame.minX + 127, leaderBoardFrame.minY + 0))
    bezier2Path.closePath()
    CGContextSaveGState(context)
    CGContextSetShadowWithColor(context, buttonShadowOffset, buttonShadowBlurRadius, (buttonShadow as UIColor).CGColor)
    color37.setFill()
    bezier2Path.fill()
    CGContextRestoreGState(context)


    if state == .Normal {
      //// Group
      //// Rectangle 2 Drawing
      let rectangle2Path = UIBezierPath(roundedRect: CGRectMake(leaderBoardFrame.minX + 63, leaderBoardFrame.minY + 99, 26, 64), cornerRadius: 2)
      gradient3Color1.setFill()
      rectangle2Path.fill()


      //// Rectangle 3 Drawing
      let rectangle3Path = UIBezierPath(roundedRect: CGRectMake(leaderBoardFrame.minX + 91, leaderBoardFrame.minY + 119, 25, 44), cornerRadius: 2)
      gradient3Color1.setFill()
      rectangle3Path.fill()


      //// Rectangle 4 Drawing
      let rectangle4Path = UIBezierPath(roundedRect: CGRectMake(leaderBoardFrame.minX + 36, leaderBoardFrame.minY + 137, 25, 26), cornerRadius: 2)
      gradient3Color1.setFill()
      rectangle4Path.fill()


      //// Text 8 Drawing
      let text8Rect = CGRectMake(leaderBoardFrame.minX + 91, leaderBoardFrame.minY + 119, 25, 44)
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, shadow8Offset, shadow8BlurRadius, (shadow8 as UIColor).CGColor)
      let text8Style = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
      text8Style.alignment = NSTextAlignment.Center

      let text8FontAttributes = [NSFontAttributeName: UIFont(name: "Arial-BoldMT", size: 23)!, NSForegroundColorAttributeName: UIColor.whiteColor(), NSParagraphStyleAttributeName: text8Style]

      "2".drawInRect(text8Rect, withAttributes: text8FontAttributes)
      CGContextRestoreGState(context)



      //// Text 9 Drawing
      let text9Rect = CGRectMake(leaderBoardFrame.minX + 36, leaderBoardFrame.minY + 137, 25, 26)
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, shadow8Offset, shadow8BlurRadius, (shadow8 as UIColor).CGColor)
      let text9Style = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
      text9Style.alignment = NSTextAlignment.Center

      let text9FontAttributes = [NSFontAttributeName: UIFont(name: "Arial-BoldMT", size: 23)!, NSForegroundColorAttributeName: UIColor.whiteColor(), NSParagraphStyleAttributeName: text9Style]

      "3".drawInRect(text9Rect, withAttributes: text9FontAttributes)
      CGContextRestoreGState(context)



      //// Text 3 Drawing
      let text3Rect = CGRectMake(leaderBoardFrame.minX + 63, leaderBoardFrame.minY + 99, 26, 64)
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, shadow8Offset, shadow8BlurRadius, (shadow8 as UIColor).CGColor)
      let text3Style = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
      text3Style.alignment = NSTextAlignment.Center

      let text3FontAttributes = [NSFontAttributeName: UIFont(name: "Arial-BoldMT", size: 23)!, NSForegroundColorAttributeName: UIColor.whiteColor(), NSParagraphStyleAttributeName: text3Style]

      "1".drawInRect(text3Rect, withAttributes: text3FontAttributes)
      CGContextRestoreGState(context)
    }
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

    //// Facebook Button
    //// Bezier 5 Drawing
    var bezier5Path = UIBezierPath()
    bezier5Path.moveToPoint(CGPointMake(facebookFrame.minX + 80.08, facebookFrame.minY + 98.15))
    bezier5Path.addCurveToPoint(CGPointMake(facebookFrame.minX + 67.22, facebookFrame.minY + 102.39), controlPoint1: CGPointMake(facebookFrame.minX + 74.34, facebookFrame.minY + 98.15), controlPoint2: CGPointMake(facebookFrame.minX + 70.06, facebookFrame.minY + 99.56))
    bezier5Path.addCurveToPoint(CGPointMake(facebookFrame.minX + 62.98, facebookFrame.minY + 115.13), controlPoint1: CGPointMake(facebookFrame.minX + 64.39, facebookFrame.minY + 105.22), controlPoint2: CGPointMake(facebookFrame.minX + 62.98, facebookFrame.minY + 109.47))
    bezier5Path.addLineToPoint(CGPointMake(facebookFrame.minX + 62.98, facebookFrame.minY + 116.41))
    bezier5Path.addLineToPoint(CGPointMake(facebookFrame.minX + 57, facebookFrame.minY + 116.41))
    bezier5Path.addLineToPoint(CGPointMake(facebookFrame.minX + 57, facebookFrame.minY + 126.47))
    bezier5Path.addLineToPoint(CGPointMake(facebookFrame.minX + 62.98, facebookFrame.minY + 126.47))
    bezier5Path.addLineToPoint(CGPointMake(facebookFrame.minX + 62.98, facebookFrame.minY + 162.7))
    bezier5Path.addLineToPoint(CGPointMake(facebookFrame.minX + 76.94, facebookFrame.minY + 162.7))
    bezier5Path.addLineToPoint(CGPointMake(facebookFrame.minX + 76.94, facebookFrame.minY + 126.47))
    bezier5Path.addLineToPoint(CGPointMake(facebookFrame.minX + 87.26, facebookFrame.minY + 126.47))
    bezier5Path.addLineToPoint(CGPointMake(facebookFrame.minX + 87.26, facebookFrame.minY + 116.41))
    bezier5Path.addLineToPoint(CGPointMake(facebookFrame.minX + 76.48, facebookFrame.minY + 116.41))
    bezier5Path.addLineToPoint(CGPointMake(facebookFrame.minX + 76.48, facebookFrame.minY + 116.04))
    bezier5Path.addCurveToPoint(CGPointMake(facebookFrame.minX + 77.93, facebookFrame.minY + 109.98), controlPoint1: CGPointMake(facebookFrame.minX + 76.48, facebookFrame.minY + 113.04), controlPoint2: CGPointMake(facebookFrame.minX + 76.96, facebookFrame.minY + 111.02))
    bezier5Path.addCurveToPoint(CGPointMake(facebookFrame.minX + 83.5, facebookFrame.minY + 108.41), controlPoint1: CGPointMake(facebookFrame.minX + 78.9, facebookFrame.minY + 108.93), controlPoint2: CGPointMake(facebookFrame.minX + 80.76, facebookFrame.minY + 108.41))
    bezier5Path.addCurveToPoint(CGPointMake(facebookFrame.minX + 86.7, facebookFrame.minY + 108.78), controlPoint1: CGPointMake(facebookFrame.minX + 84.63, facebookFrame.minY + 108.41), controlPoint2: CGPointMake(facebookFrame.minX + 85.7, facebookFrame.minY + 108.53))
    bezier5Path.addCurveToPoint(CGPointMake(facebookFrame.minX + 89.12, facebookFrame.minY + 109.44), controlPoint1: CGPointMake(facebookFrame.minX + 87.69, facebookFrame.minY + 109.03), controlPoint2: CGPointMake(facebookFrame.minX + 88.5, facebookFrame.minY + 109.25))
    bezier5Path.addLineToPoint(CGPointMake(facebookFrame.minX + 90.17, facebookFrame.minY + 109.44))
    bezier5Path.addLineToPoint(CGPointMake(facebookFrame.minX + 90.17, facebookFrame.minY + 98.97))
    bezier5Path.addCurveToPoint(CGPointMake(facebookFrame.minX + 85.71, facebookFrame.minY + 98.37), controlPoint1: CGPointMake(facebookFrame.minX + 88.88, facebookFrame.minY + 98.72), controlPoint2: CGPointMake(facebookFrame.minX + 87.39, facebookFrame.minY + 98.52))
    bezier5Path.addCurveToPoint(CGPointMake(facebookFrame.minX + 80.08, facebookFrame.minY + 98.15), controlPoint1: CGPointMake(facebookFrame.minX + 84.03, facebookFrame.minY + 98.22), controlPoint2: CGPointMake(facebookFrame.minX + 82.15, facebookFrame.minY + 98.15))
    bezier5Path.closePath()
    bezier5Path.moveToPoint(CGPointMake(facebookFrame.minX + 127, facebookFrame.minY + 264))
    bezier5Path.addLineToPoint(CGPointMake(facebookFrame.minX + 75, facebookFrame.minY + 196.7))
    bezier5Path.addLineToPoint(CGPointMake(facebookFrame.minX + 23.93, facebookFrame.minY + 264))
    bezier5Path.addLineToPoint(CGPointMake(facebookFrame.minX + 23, facebookFrame.minY + 58.33))
    bezier5Path.addLineToPoint(CGPointMake(facebookFrame.minX + 127, facebookFrame.minY + 58.33))
    bezier5Path.addLineToPoint(CGPointMake(facebookFrame.minX + 127, facebookFrame.minY + 264))
    bezier5Path.closePath()
    bezier5Path.moveToPoint(CGPointMake(facebookFrame.minX + 23, facebookFrame.minY + 58.33))
    bezier5Path.addLineToPoint(CGPointMake(facebookFrame.minX + 127, facebookFrame.minY + 58.33))
    bezier5Path.addLineToPoint(CGPointMake(facebookFrame.minX + 127, facebookFrame.minY))
    bezier5Path.addLineToPoint(CGPointMake(facebookFrame.minX + 23, facebookFrame.minY))
    bezier5Path.addLineToPoint(CGPointMake(facebookFrame.minX + 23, facebookFrame.minY + 58.33))
    bezier5Path.closePath()
    CGContextSaveGState(context)
    CGContextSetShadowWithColor(context, buttonShadowOffset, buttonShadowBlurRadius, (buttonShadow as UIColor).CGColor)
    facebookColor.setFill()
    bezier5Path.fill()
    CGContextRestoreGState(context)


    if state == .Normal {
      //// Text 2 Drawing
      var text2Path = UIBezierPath()
      text2Path.moveToPoint(CGPointMake(facebookFrame.minX + 91.5, facebookFrame.minY + 109.44))
      text2Path.addLineToPoint(CGPointMake(facebookFrame.minX + 90.4, facebookFrame.minY + 109.44))
      text2Path.addCurveToPoint(CGPointMake(facebookFrame.minX + 87.86, facebookFrame.minY + 108.77), controlPoint1: CGPointMake(facebookFrame.minX + 89.75, facebookFrame.minY + 109.24), controlPoint2: CGPointMake(facebookFrame.minX + 88.91, facebookFrame.minY + 109.02))
      text2Path.addCurveToPoint(CGPointMake(facebookFrame.minX + 84.51, facebookFrame.minY + 108.39), controlPoint1: CGPointMake(facebookFrame.minX + 86.82, facebookFrame.minY + 108.52), controlPoint2: CGPointMake(facebookFrame.minX + 85.7, facebookFrame.minY + 108.39))
      text2Path.addCurveToPoint(CGPointMake(facebookFrame.minX + 78.68, facebookFrame.minY + 109.98), controlPoint1: CGPointMake(facebookFrame.minX + 81.64, facebookFrame.minY + 108.39), controlPoint2: CGPointMake(facebookFrame.minX + 79.7, facebookFrame.minY + 108.92))
      text2Path.addCurveToPoint(CGPointMake(facebookFrame.minX + 77.16, facebookFrame.minY + 116.13), controlPoint1: CGPointMake(facebookFrame.minX + 77.67, facebookFrame.minY + 111.04), controlPoint2: CGPointMake(facebookFrame.minX + 77.16, facebookFrame.minY + 113.09))
      text2Path.addLineToPoint(CGPointMake(facebookFrame.minX + 77.16, facebookFrame.minY + 116.51))
      text2Path.addLineToPoint(CGPointMake(facebookFrame.minX + 88.45, facebookFrame.minY + 116.51))
      text2Path.addLineToPoint(CGPointMake(facebookFrame.minX + 88.45, facebookFrame.minY + 126.72))
      text2Path.addLineToPoint(CGPointMake(facebookFrame.minX + 77.65, facebookFrame.minY + 126.72))
      text2Path.addLineToPoint(CGPointMake(facebookFrame.minX + 77.65, facebookFrame.minY + 163.5))
      text2Path.addLineToPoint(CGPointMake(facebookFrame.minX + 63.03, facebookFrame.minY + 163.5))
      text2Path.addLineToPoint(CGPointMake(facebookFrame.minX + 63.03, facebookFrame.minY + 126.72))
      text2Path.addLineToPoint(CGPointMake(facebookFrame.minX + 56.77, facebookFrame.minY + 126.72))
      text2Path.addLineToPoint(CGPointMake(facebookFrame.minX + 56.77, facebookFrame.minY + 116.51))
      text2Path.addLineToPoint(CGPointMake(facebookFrame.minX + 63.03, facebookFrame.minY + 116.51))
      text2Path.addLineToPoint(CGPointMake(facebookFrame.minX + 63.03, facebookFrame.minY + 115.21))
      text2Path.addCurveToPoint(CGPointMake(facebookFrame.minX + 67.47, facebookFrame.minY + 102.28), controlPoint1: CGPointMake(facebookFrame.minX + 63.03, facebookFrame.minY + 109.47), controlPoint2: CGPointMake(facebookFrame.minX + 64.51, facebookFrame.minY + 105.16))
      text2Path.addCurveToPoint(CGPointMake(facebookFrame.minX + 80.94, facebookFrame.minY + 97.97), controlPoint1: CGPointMake(facebookFrame.minX + 70.44, facebookFrame.minY + 99.41), controlPoint2: CGPointMake(facebookFrame.minX + 74.93, facebookFrame.minY + 97.97))
      text2Path.addCurveToPoint(CGPointMake(facebookFrame.minX + 86.83, facebookFrame.minY + 98.2), controlPoint1: CGPointMake(facebookFrame.minX + 83.11, facebookFrame.minY + 97.97), controlPoint2: CGPointMake(facebookFrame.minX + 85.07, facebookFrame.minY + 98.05))
      text2Path.addCurveToPoint(CGPointMake(facebookFrame.minX + 91.5, facebookFrame.minY + 98.81), controlPoint1: CGPointMake(facebookFrame.minX + 88.59, facebookFrame.minY + 98.36), controlPoint2: CGPointMake(facebookFrame.minX + 90.15, facebookFrame.minY + 98.56))
      text2Path.addLineToPoint(CGPointMake(facebookFrame.minX + 91.5, facebookFrame.minY + 109.44))
      text2Path.closePath()
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, textShadowOffset, textShadowBlurRadius, (textShadow as UIColor).CGColor)
      fillColor.setFill()
      text2Path.fill()
      CGContextRestoreGState(context)

      fillColor.setStroke()
      text2Path.lineWidth = 1
      text2Path.stroke()
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

    //// Twitter Button
    //// Bezier 4 Drawing
    var bezier4Path = UIBezierPath()
    bezier4Path.moveToPoint(CGPointMake(twitterFrame.minX + 78.19, twitterFrame.minY + 98.5))
    bezier4Path.addLineToPoint(CGPointMake(twitterFrame.minX + 62.91, twitterFrame.minY + 98.5))
    bezier4Path.addCurveToPoint(CGPointMake(twitterFrame.minX + 62.91, twitterFrame.minY + 111.75), controlPoint1: CGPointMake(twitterFrame.minX + 62.91, twitterFrame.minY + 98.5), controlPoint2: CGPointMake(twitterFrame.minX + 62.91, twitterFrame.minY + 108.29))
    bezier4Path.addCurveToPoint(CGPointMake(twitterFrame.minX + 62.91, twitterFrame.minY + 112.95), controlPoint1: CGPointMake(twitterFrame.minX + 62.91, twitterFrame.minY + 112.5), controlPoint2: CGPointMake(twitterFrame.minX + 62.91, twitterFrame.minY + 112.95))
    bezier4Path.addLineToPoint(CGPointMake(twitterFrame.minX + 56.62, twitterFrame.minY + 112.95))
    bezier4Path.addLineToPoint(CGPointMake(twitterFrame.minX + 56.62, twitterFrame.minY + 123.94))
    bezier4Path.addLineToPoint(CGPointMake(twitterFrame.minX + 62.91, twitterFrame.minY + 123.94))
    bezier4Path.addLineToPoint(CGPointMake(twitterFrame.minX + 62.91, twitterFrame.minY + 147.57))
    bezier4Path.addCurveToPoint(CGPointMake(twitterFrame.minX + 67.26, twitterFrame.minY + 160.67), controlPoint1: CGPointMake(twitterFrame.minX + 62.91, twitterFrame.minY + 153.76), controlPoint2: CGPointMake(twitterFrame.minX + 64.36, twitterFrame.minY + 158.12))
    bezier4Path.addCurveToPoint(CGPointMake(twitterFrame.minX + 80.53, twitterFrame.minY + 164.5), controlPoint1: CGPointMake(twitterFrame.minX + 70.16, twitterFrame.minY + 163.22), controlPoint2: CGPointMake(twitterFrame.minX + 74.58, twitterFrame.minY + 164.5))
    bezier4Path.addCurveToPoint(CGPointMake(twitterFrame.minX + 87.28, twitterFrame.minY + 164.12), controlPoint1: CGPointMake(twitterFrame.minX + 83.19, twitterFrame.minY + 164.5), controlPoint2: CGPointMake(twitterFrame.minX + 85.44, twitterFrame.minY + 164.37))
    bezier4Path.addCurveToPoint(CGPointMake(twitterFrame.minX + 92.5, twitterFrame.minY + 163.06), controlPoint1: CGPointMake(twitterFrame.minX + 89.12, twitterFrame.minY + 163.86), controlPoint2: CGPointMake(twitterFrame.minX + 90.86, twitterFrame.minY + 163.51))
    bezier4Path.addLineToPoint(CGPointMake(twitterFrame.minX + 92.5, twitterFrame.minY + 151.94))
    bezier4Path.addLineToPoint(CGPointMake(twitterFrame.minX + 91.23, twitterFrame.minY + 151.94))
    bezier4Path.addCurveToPoint(CGPointMake(twitterFrame.minX + 88.53, twitterFrame.minY + 152.93), controlPoint1: CGPointMake(twitterFrame.minX + 90.72, twitterFrame.minY + 152.24), controlPoint2: CGPointMake(twitterFrame.minX + 89.82, twitterFrame.minY + 152.57))
    bezier4Path.addCurveToPoint(CGPointMake(twitterFrame.minX + 86.35, twitterFrame.minY + 153.4), controlPoint1: CGPointMake(twitterFrame.minX + 87.7, twitterFrame.minY + 153.16), controlPoint2: CGPointMake(twitterFrame.minX + 86.97, twitterFrame.minY + 153.32))
    bezier4Path.addCurveToPoint(CGPointMake(twitterFrame.minX + 85.41, twitterFrame.minY + 153.47), controlPoint1: CGPointMake(twitterFrame.minX + 86.01, twitterFrame.minY + 153.45), controlPoint2: CGPointMake(twitterFrame.minX + 85.69, twitterFrame.minY + 153.47))
    bezier4Path.addCurveToPoint(CGPointMake(twitterFrame.minX + 81.02, twitterFrame.minY + 152.55), controlPoint1: CGPointMake(twitterFrame.minX + 83.48, twitterFrame.minY + 153.47), controlPoint2: CGPointMake(twitterFrame.minX + 82.02, twitterFrame.minY + 153.16))
    bezier4Path.addCurveToPoint(CGPointMake(twitterFrame.minX + 78.91, twitterFrame.minY + 150.05), controlPoint1: CGPointMake(twitterFrame.minX + 80.01, twitterFrame.minY + 151.93), controlPoint2: CGPointMake(twitterFrame.minX + 79.31, twitterFrame.minY + 151.1))
    bezier4Path.addCurveToPoint(CGPointMake(twitterFrame.minX + 78.23, twitterFrame.minY + 146.49), controlPoint1: CGPointMake(twitterFrame.minX + 78.49, twitterFrame.minY + 149), controlPoint2: CGPointMake(twitterFrame.minX + 78.26, twitterFrame.minY + 147.81))
    bezier4Path.addCurveToPoint(CGPointMake(twitterFrame.minX + 78.19, twitterFrame.minY + 141.85), controlPoint1: CGPointMake(twitterFrame.minX + 78.21, twitterFrame.minY + 145.17), controlPoint2: CGPointMake(twitterFrame.minX + 78.19, twitterFrame.minY + 143.63))
    bezier4Path.addCurveToPoint(CGPointMake(twitterFrame.minX + 78.19, twitterFrame.minY + 138.91), controlPoint1: CGPointMake(twitterFrame.minX + 78.19, twitterFrame.minY + 141.85), controlPoint2: CGPointMake(twitterFrame.minX + 78.19, twitterFrame.minY + 140.67))
    bezier4Path.addCurveToPoint(CGPointMake(twitterFrame.minX + 78.19, twitterFrame.minY + 123.94), controlPoint1: CGPointMake(twitterFrame.minX + 78.19, twitterFrame.minY + 133.82), controlPoint2: CGPointMake(twitterFrame.minX + 78.19, twitterFrame.minY + 123.94))
    bezier4Path.addLineToPoint(CGPointMake(twitterFrame.minX + 92.5, twitterFrame.minY + 123.94))
    bezier4Path.addLineToPoint(CGPointMake(twitterFrame.minX + 92.5, twitterFrame.minY + 112.95))
    bezier4Path.addLineToPoint(CGPointMake(twitterFrame.minX + 78.19, twitterFrame.minY + 112.95))
    bezier4Path.addLineToPoint(CGPointMake(twitterFrame.minX + 78.19, twitterFrame.minY + 98.5))
    bezier4Path.closePath()
    bezier4Path.moveToPoint(CGPointMake(twitterFrame.minX + 127, twitterFrame.minY + 0))
    bezier4Path.addCurveToPoint(CGPointMake(twitterFrame.minX + 127, twitterFrame.minY + 58.33), controlPoint1: CGPointMake(twitterFrame.minX + 127, twitterFrame.minY), controlPoint2: CGPointMake(twitterFrame.minX + 127, twitterFrame.minY + 58.33))
    bezier4Path.addLineToPoint(CGPointMake(twitterFrame.minX + 127, twitterFrame.minY + 264))
    bezier4Path.addLineToPoint(CGPointMake(twitterFrame.minX + 75, twitterFrame.minY + 196.7))
    bezier4Path.addLineToPoint(CGPointMake(twitterFrame.minX + 23.93, twitterFrame.minY + 264))
    bezier4Path.addLineToPoint(CGPointMake(twitterFrame.minX + 23, twitterFrame.minY + 58.33))
    bezier4Path.addCurveToPoint(CGPointMake(twitterFrame.minX + 23, twitterFrame.minY + 28.38), controlPoint1: CGPointMake(twitterFrame.minX + 23, twitterFrame.minY + 58.33), controlPoint2: CGPointMake(twitterFrame.minX + 23, twitterFrame.minY + 43.22))
    bezier4Path.addCurveToPoint(CGPointMake(twitterFrame.minX + 23, twitterFrame.minY + 0), controlPoint1: CGPointMake(twitterFrame.minX + 23, twitterFrame.minY + 14.17), controlPoint2: CGPointMake(twitterFrame.minX + 23, twitterFrame.minY + 0.21))
    bezier4Path.addLineToPoint(CGPointMake(twitterFrame.minX + 127, twitterFrame.minY))
    bezier4Path.addLineToPoint(CGPointMake(twitterFrame.minX + 127, twitterFrame.minY + 0))
    bezier4Path.closePath()
    CGContextSaveGState(context)
    CGContextSetShadowWithColor(context, buttonShadowOffset, buttonShadowBlurRadius, (buttonShadow as UIColor).CGColor)
    twitterColor.setFill()
    bezier4Path.fill()
    CGContextRestoreGState(context)


    if state == .Normal {
      //// Text 5 Drawing
      var text5Path = UIBezierPath()
      text5Path.moveToPoint(CGPointMake(twitterFrame.minX + 92.5, twitterFrame.minY + 163.06))
      text5Path.addCurveToPoint(CGPointMake(twitterFrame.minX + 87.28, twitterFrame.minY + 164.12), controlPoint1: CGPointMake(twitterFrame.minX + 90.86, twitterFrame.minY + 163.51), controlPoint2: CGPointMake(twitterFrame.minX + 89.12, twitterFrame.minY + 163.86))
      text5Path.addCurveToPoint(CGPointMake(twitterFrame.minX + 80.53, twitterFrame.minY + 164.5), controlPoint1: CGPointMake(twitterFrame.minX + 85.44, twitterFrame.minY + 164.37), controlPoint2: CGPointMake(twitterFrame.minX + 83.19, twitterFrame.minY + 164.5))
      text5Path.addCurveToPoint(CGPointMake(twitterFrame.minX + 67.26, twitterFrame.minY + 160.67), controlPoint1: CGPointMake(twitterFrame.minX + 74.58, twitterFrame.minY + 164.5), controlPoint2: CGPointMake(twitterFrame.minX + 70.16, twitterFrame.minY + 163.22))
      text5Path.addCurveToPoint(CGPointMake(twitterFrame.minX + 62.91, twitterFrame.minY + 147.57), controlPoint1: CGPointMake(twitterFrame.minX + 64.36, twitterFrame.minY + 158.12), controlPoint2: CGPointMake(twitterFrame.minX + 62.91, twitterFrame.minY + 153.76))
      text5Path.addLineToPoint(CGPointMake(twitterFrame.minX + 62.91, twitterFrame.minY + 123.94))
      text5Path.addLineToPoint(CGPointMake(twitterFrame.minX + 56.62, twitterFrame.minY + 123.94))
      text5Path.addLineToPoint(CGPointMake(twitterFrame.minX + 56.62, twitterFrame.minY + 112.95))
      text5Path.addLineToPoint(CGPointMake(twitterFrame.minX + 62.91, twitterFrame.minY + 112.95))
      text5Path.addLineToPoint(CGPointMake(twitterFrame.minX + 62.91, twitterFrame.minY + 98.5))
      text5Path.addLineToPoint(CGPointMake(twitterFrame.minX + 78.19, twitterFrame.minY + 98.5))
      text5Path.addLineToPoint(CGPointMake(twitterFrame.minX + 78.19, twitterFrame.minY + 112.95))
      text5Path.addLineToPoint(CGPointMake(twitterFrame.minX + 92.5, twitterFrame.minY + 112.95))
      text5Path.addLineToPoint(CGPointMake(twitterFrame.minX + 92.5, twitterFrame.minY + 123.94))
      text5Path.addLineToPoint(CGPointMake(twitterFrame.minX + 78.19, twitterFrame.minY + 123.94))
      text5Path.addLineToPoint(CGPointMake(twitterFrame.minX + 78.19, twitterFrame.minY + 141.85))
      text5Path.addCurveToPoint(CGPointMake(twitterFrame.minX + 78.23, twitterFrame.minY + 146.49), controlPoint1: CGPointMake(twitterFrame.minX + 78.19, twitterFrame.minY + 143.63), controlPoint2: CGPointMake(twitterFrame.minX + 78.21, twitterFrame.minY + 145.17))
      text5Path.addCurveToPoint(CGPointMake(twitterFrame.minX + 78.91, twitterFrame.minY + 150.05), controlPoint1: CGPointMake(twitterFrame.minX + 78.26, twitterFrame.minY + 147.81), controlPoint2: CGPointMake(twitterFrame.minX + 78.49, twitterFrame.minY + 149))
      text5Path.addCurveToPoint(CGPointMake(twitterFrame.minX + 81.02, twitterFrame.minY + 152.55), controlPoint1: CGPointMake(twitterFrame.minX + 79.31, twitterFrame.minY + 151.1), controlPoint2: CGPointMake(twitterFrame.minX + 80.01, twitterFrame.minY + 151.93))
      text5Path.addCurveToPoint(CGPointMake(twitterFrame.minX + 85.41, twitterFrame.minY + 153.47), controlPoint1: CGPointMake(twitterFrame.minX + 82.02, twitterFrame.minY + 153.16), controlPoint2: CGPointMake(twitterFrame.minX + 83.48, twitterFrame.minY + 153.47))
      text5Path.addCurveToPoint(CGPointMake(twitterFrame.minX + 88.53, twitterFrame.minY + 152.93), controlPoint1: CGPointMake(twitterFrame.minX + 86.2, twitterFrame.minY + 153.47), controlPoint2: CGPointMake(twitterFrame.minX + 87.24, twitterFrame.minY + 153.29))
      text5Path.addCurveToPoint(CGPointMake(twitterFrame.minX + 91.23, twitterFrame.minY + 151.94), controlPoint1: CGPointMake(twitterFrame.minX + 89.82, twitterFrame.minY + 152.57), controlPoint2: CGPointMake(twitterFrame.minX + 90.72, twitterFrame.minY + 152.24))
      text5Path.addLineToPoint(CGPointMake(twitterFrame.minX + 92.5, twitterFrame.minY + 151.94))
      text5Path.addLineToPoint(CGPointMake(twitterFrame.minX + 92.5, twitterFrame.minY + 163.06))
      text5Path.closePath()
      CGContextSaveGState(context)
      CGContextSetShadowWithColor(context, textShadowOffset, textShadowBlurRadius, (textShadow as UIColor).CGColor)
      fillColor.setFill()
      text5Path.fill()
      CGContextRestoreGState(context)

      fillColor.setStroke()
      text5Path.lineWidth = 1
      text5Path.stroke()
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