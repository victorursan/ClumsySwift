//
//  ClumsyScoreView.swift
//  ClumsySwift
//
//  Created by Victor Ursan on 8/1/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit
import GameKit

protocol ClumsyScoreViewDelegate {
  func presentSocialViewController(socialViewController: UIViewController)
  func showSocialButtons()
}

class ClumsyScoreView: UIView, ClumsyOkButtonDelegate, ClumsySocialButtonDelegate, GKGameCenterControllerDelegate {
  private var delegate: ClumsyScoreViewDelegate
  private var score: Int = 0
  private var bestScore: Int = 0

  required init(coder: NSCoder) {
    fatalError("NSCoding not supported")
  }

  init(frame: CGRect, delegate: ClumsyScoreViewDelegate, score: Int) {
    self.delegate = delegate
    super.init(frame: frame)
    self.score = score
    var scoreHandler = ClumsyScoreHandler()
    self.bestScore = scoreHandler.bestScore()
    scoreHandler.checkScore(self.score)
    let isNewHighscore: Bool = self.bestScore < self.score
    if (self.bestScore < self.score) {
      scoreHandler.checkScore(self.score)
      self.saveHighscore(scoreHandler.bestScore())
    }
    self.bestScore = scoreHandler.bestScore()
    var scoreView = UIImageView(frame: frame)
    scoreView.image = imageScoreViewWithScore("\(self.score)", best:"\(self.bestScore)", newHighscore: isNewHighscore)
    scoreView.contentMode = UIViewContentMode.ScaleAspectFit

    var okButton = ClumsyOkButton(frame: CGRectMake(frame.width*0.7028, frame.height*0.7817, frame.width*0.2626, frame.width*0.18125),
      target: self)
    var facebookButton = ClumsySocialButton(button: .FacebookScore,
      frame: CGRectMake(frame.width*0.0416, frame.height*0.7897, frame.width*0.1721, frame.width*0.1721),
      target: self)
    var twitterButton = ClumsySocialButton(button: .TwitterScore,
      frame: CGRectMake(frame.width*0.213, frame.height*0.7897, frame.width*0.1721, frame.width*0.1721),
      target: self)
    var leaderboardButton = ClumsySocialButton(button: .LeaderboardScore,
      frame: CGRectMake(frame.width*0.3844, frame.height*0.7897, frame.width*0.1721, frame.width*0.1721),
      target: self)

    addSubview(scoreView)
    addSubview(okButton)
    addSubview(facebookButton)
    addSubview(twitterButton)
    addSubview(leaderboardButton)
  }

  internal func okButtonPressed() {
    delegate.showSocialButtons()
    removeFromSuperview()
  }

  func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController!) {
    gameCenterViewController.dismissViewControllerAnimated(true, completion: nil)
  }

  func saveHighscore(score:Int) {
    if GKLocalPlayer.localPlayer().authenticated {
      var scoreReporter = GKScore(leaderboardIdentifier: "clumsyleaderboard")
      scoreReporter.value = Int64(score)
      var scoreArray: [GKScore] = [scoreReporter]
      GKScore.reportScores(scoreArray, {(error : NSError!) -> Void in
        if error != nil {
          println("error")}})
    }
  }

  func showLeader() {
    var gc = GKGameCenterViewController()
    gc.gameCenterDelegate = self
    delegate.presentSocialViewController(gc)
  }

  internal func socialButtonPressed(type: SocialButton) {
    if type == .LeaderboardScore{
      showLeader()
    } else {
      delegate.presentSocialViewController(ClumsySocialHandler().createSocialScoreSheetFor(type, score: self.score ))
    }
  }

  private func imageScoreViewWithScore(score: String, best: String, newHighscore: Bool) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(552, 623), false, 0)
    drawScoreViewWithScore(score, best: best, newHighscore: newHighscore)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
  }

  private func drawScoreViewWithScore(score: String, best: String, newHighscore: Bool) {
    //// General Declarations
    let frame = CGRectMake(0, 0, 552, 623)
    let context = UIGraphicsGetCurrentContext()

    //// Color Declarations
    let shadowColor2 = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
    let fillColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
    let color31 = UIColor(red: 0.734, green: 0.535, blue: 0.006, alpha: 1.000)
    let color32 = UIColor(red: 1.000, green: 0.770, blue: 0.192, alpha: 1.000)

    //// Shadow Declarations
    let buttonShadow = shadowColor2.colorWithAlphaComponent(0.67)
    let buttonShadowOffset = CGSizeMake(0.1, -0.1)
    let buttonShadowBlurRadius: CGFloat = 7


    //// Subframes
    let newBestFrane: CGRect = CGRectMake(frame.minX + 120, frame.minY + 414, 83, 69)


    //// Main Rectangle Drawing
    let mainRectanglePath = UIBezierPath(roundedRect: CGRectMake(frame.minX + 21, frame.minY + 287, 510, 300), cornerRadius: 30)
    CGContextSaveGState(context)
    CGContextSetShadowWithColor(context, buttonShadowOffset, buttonShadowBlurRadius, buttonShadow.CGColor)
    color32.setFill()
    mainRectanglePath.fill()
    CGContextRestoreGState(context)


    //// Clumsy Text Drawing
    let clumsyTextRect: CGRect = CGRectMake(frame.minX + 18, frame.minY, 515, 192)
    CGContextSaveGState(context)
    CGContextSetShadowWithColor(context, buttonShadowOffset, buttonShadowBlurRadius, buttonShadow.CGColor)
    let clumsyTextStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
    clumsyTextStyle.alignment = NSTextAlignment.Center;

    let clumsyTextFontAttributes = [NSFontAttributeName: UIFont(name: clumsyFont, size: 150)!,
      NSForegroundColorAttributeName: fillColor,
      NSParagraphStyleAttributeName: clumsyTextStyle]
    "Clumsy".drawInRect(clumsyTextRect, withAttributes: clumsyTextFontAttributes);
    CGContextRestoreGState(context)



    //// Score text Drawing
    let scoreTextRect: CGRect = CGRectMake(frame.minX + 169, frame.minY + 324, 129, 58)
    var scoreTextTextContent = NSString(string: "score:")
    let scoreTextStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
    scoreTextStyle.alignment = NSTextAlignment.Center

    let scoreTextFontAtrributes = [NSFontAttributeName]
    let scoreTextFontAttributes = [NSFontAttributeName: UIFont(name: clumsyFont, size: 40)!,
      NSForegroundColorAttributeName: color31,
      NSParagraphStyleAttributeName: scoreTextStyle]

    scoreTextTextContent.drawInRect(CGRectOffset(scoreTextRect, 0, (scoreTextRect.height - scoreTextTextContent.boundingRectWithSize(scoreTextRect.size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: scoreTextFontAttributes, context: nil).size.height) / 2), withAttributes: scoreTextFontAttributes);


    //// Best text Drawing
    let bestTextRect: CGRect = CGRectMake(frame.minX + 189, frame.minY + 422, 109, 54)
    var bestTextTextContent = NSString(string: "best:")
    let bestTextStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
    bestTextStyle.alignment = NSTextAlignment.Center;

    let bestTextFontAttributes = [NSFontAttributeName: UIFont(name: clumsyFont, size: 40)!,
      NSForegroundColorAttributeName: color31,
      NSParagraphStyleAttributeName: bestTextStyle]

    bestTextTextContent.drawInRect(CGRectOffset(bestTextRect, 0, (bestTextRect.height - bestTextTextContent.boundingRectWithSize(bestTextRect.size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: bestTextFontAttributes, context: nil).size.height) / 2), withAttributes: bestTextFontAttributes);

    if (newHighscore) {
      //// new Rectangle Drawing
      let newRectanglePath = UIBezierPath(roundedRect: CGRectMake(newBestFrane.minX + 3.37, newBestFrane.minY + 8.86, 76.5, 52), cornerRadius: 16)
      UIColor.redColor().setFill()
      newRectanglePath.fill()


      //// new Text Drawing
      let newTextRect: CGRect = CGRectMake(newBestFrane.minX + 3, newBestFrane.minY + 9, 77, 52)
      var newTextTextContent = NSString(string: "New")
      let newTextStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
      newTextStyle.alignment = NSTextAlignment.Center


      let newTextFontAttributes = [NSFontAttributeName: UIFont(name: clumsyFontBold, size: 35)!,
        NSForegroundColorAttributeName: fillColor,
        NSParagraphStyleAttributeName: newTextStyle]

      newTextTextContent.drawInRect(CGRectOffset(newTextRect, 0, (newTextRect.height - newTextTextContent.boundingRectWithSize(newTextRect.size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: newTextFontAttributes, context: nil).size.height) / 2), withAttributes: newTextFontAttributes);
    }

    //// Score Label Drawing
    let scoreLabelRect: CGRect = CGRectMake(frame.minX + 286, frame.minY + 306, 175, 93)
    let scoreLabelStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
    scoreLabelStyle.alignment = NSTextAlignment.Center;

    let scoreLabelFontAttributes = [NSFontAttributeName: UIFont(name: clumsyFont, size: 80)!,
      NSForegroundColorAttributeName: fillColor,
      NSParagraphStyleAttributeName: scoreLabelStyle]

    NSString(string: score).drawInRect(CGRectOffset(scoreLabelRect, 0, (scoreLabelRect.height - NSString(string: score).boundingRectWithSize(scoreLabelRect.size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: scoreLabelFontAttributes, context: nil).size.height) / 2), withAttributes: scoreLabelFontAttributes);


    //// Best Score Label Drawing
    let bestScoreLabelRect: CGRect = CGRectMake(frame.minX + 288, frame.minY + 402, 173, 93)
    let bestScoreLabelStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
    bestScoreLabelStyle.alignment = NSTextAlignment.Center

    let bestScoreLabelFontAttributes = [NSFontAttributeName: UIFont(name: clumsyFont, size: 80)!,
      NSForegroundColorAttributeName: fillColor,
      NSParagraphStyleAttributeName: bestScoreLabelStyle]

    NSString(string: best).drawInRect(CGRectOffset(bestScoreLabelRect, 0, (bestScoreLabelRect.height - NSString(string: best).boundingRectWithSize(bestScoreLabelRect.size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: bestScoreLabelFontAttributes, context: nil).size.height) / 2), withAttributes: bestScoreLabelFontAttributes);
  }
}
