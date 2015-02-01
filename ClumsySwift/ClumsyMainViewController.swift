//
//  ClumsyMainViewController.swift
//  ClumsySwift
//
//  Created by Victor Ursan on 7/24/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit
import CoreMotion
import GameKit

class ClumsyMainViewController: UIViewController, ClumsyMainButtonDelegate, ClumsySwipeGestureRecognizerDelegate, ClumsyShakeDelegate, ClumsyEngineDelegate, ClumsySocialButtonDelegate, ClumsyScoreViewDelegate, GKGameCenterControllerDelegate {

  private var mainView: ClumsyMainView?
  private var actionView: ClumsyActionView?
  private var mainButton: ClumsyMainButton?
  private var engine: ClumsyEngine?
  private var progressBar: ClumsyProgressBar?
  private var shake: ClumsyShake?
  private var facebookButton: ClumsySocialButton?
  private var twitterButton: ClumsySocialButton?
  private var leaderboardButton: ClumsySocialButton?

  override func viewDidLoad() {
    super.viewDidLoad()
    self.authenticateLocalPlayer()
    progressBar = ClumsyProgressBar(frame: CGRectMake(0, -7, view.bounds.width, 20))
    mainView = ClumsyMainView(frame: view.frame)
    actionView = ClumsyActionView(frame: CGRectMake(0, 0, view.frame.width/2+100, (view.frame.width/2+100)*1.18))
    mainButton = ClumsyMainButton(frame: view.frame, target: self)
    facebookButton = ClumsySocialButton(button: .FacebookShare,
      frame: CGRectMake(view.frame.width*0.828, 0, view.frame.width*0.1562, view.frame.width*0.3125),
      target: self)
    twitterButton = ClumsySocialButton(button: .TwitterShare,
      frame: CGRectMake(view.frame.width*0.656, 0, view.frame.width*0.1562, view.frame.width*0.3125),
      target: self)
    leaderboardButton = ClumsySocialButton(button: .LeaderboardMain,
      frame: CGRectMake(view.frame.width*0.484, 0, view.frame.width*0.1562, view.frame.width*0.3125),
      target: self)
    engine = ClumsyEngine(target: self)
    shake = ClumsyShake(target: self)

    view = mainView!
    view.addSubview(actionView!)
    view.addSubview(mainButton!)
    view.addSubview(progressBar!)
    view.addSubview(facebookButton!)
    view.addSubview(twitterButton!)
    view.addSubview(leaderboardButton!)
    addSwipes()
    actionView!.viewForAction(.Start)
  }

  func authenticateLocalPlayer(){
    var localPlayer = GKLocalPlayer.localPlayer()
    localPlayer.authenticateHandler = {(viewController, error) -> Void in
      if (viewController != nil) {
        self.presentViewController(viewController, animated: true, completion: nil)
      }
      else {
        println((GKLocalPlayer.localPlayer().authenticated))
      }
    }
  }

  private func addSwipes() {
    view.addGestureRecognizer(ClumsySwipeGestureRecognizer(direction: .Up, target: self))
    view.addGestureRecognizer(ClumsySwipeGestureRecognizer(direction: .Down, target: self))
    view.addGestureRecognizer(ClumsySwipeGestureRecognizer(direction: .Left, target: self))
    view.addGestureRecognizer(ClumsySwipeGestureRecognizer(direction: .Right, target: self))
  }

  private func swipesEnabled(enabled: Bool) {
    for swipe: UIGestureRecognizer in view.gestureRecognizers as [UIGestureRecognizer] {
      swipe.enabled = enabled
    }
  }

  internal func screenWasTapped() {
    if (actionView!.action == Action.Start) {
      swipesEnabled(true)
      progressBar!.hidden = false
      engine!.start()
      hideSocialButtons()
    } else {
      engine!.verifyClumsyAction(.Tap)
    }
  }

  internal func screenWasDoubleTapped() {
    engine!.verifyClumsyAction(.DoubleTap)
  }

  internal func screenWasSwiped(swipe: UISwipeGestureRecognizer) {
    switch swipe.direction {
    case UISwipeGestureRecognizerDirection.Left : engine!.verifyClumsyAction(.SwipeLeft)
    case UISwipeGestureRecognizerDirection.Right : engine!.verifyClumsyAction(.SwipeRight)
    case UISwipeGestureRecognizerDirection.Up : engine!.verifyClumsyAction(.SwipeUp)
    case UISwipeGestureRecognizerDirection.Down : engine!.verifyClumsyAction(.SwipeDown)
    default : println("Error")
    }
  }

  internal func wasShaken() {
    shake!.stopDeviceMotion()
    engine!.verifyClumsyAction(.Shake)
  }

  internal func setClumsyActionView(action: Action) {
    if (action == Action.DoubleTap) {
      mainButton!.singleTapEnabled(false)
    } else {
      mainButton!.singleTapEnabled(true)
    }
    if (action == .Shake) {
      shake!.startDeviceMotion()
    } else {
      shake!.stopDeviceMotion()
    }
    mainView!.nextBackgroundColor()
    actionView!.viewForAction(action)
  }

  internal func failedWithScore(score: Int) {
    progressBar!.hidden = true
    setClumsyActionView(.Start)
    mainView!.resetBackgroundColor()
    swipesEnabled(false)
    mainButton!.singleTapEnabled(false)
    mainButton!.doubleTapEnabled(false)
    shake!.stopDeviceMotion()

    let scoreView = ClumsyScoreView(frame: CGRectMake(0, 0, view.frame.width/2+100, (view.frame.width/2+100)*1.13), delegate: self, score: score)
    scoreView.center = CGPointMake(view.center.x, view.center.y-view.frame.height*0.088)
    view.addSubview(scoreView)
  }

  internal func incrementProgressViewWith(amount: Float, reset: Bool) {
    progressBar!.incrementSliderWith(amount, reset: reset)
  }


  internal func socialButtonPressed(type: SocialButton) {
    if type == .LeaderboardMain {
      var gc = GKGameCenterViewController()
      gc.gameCenterDelegate = self
      presentViewController(gc, animated: true, completion: nil)
    } else {
      presentViewController(ClumsySocialHandler().createSocialShareSheetFor(type), animated: true, completion: nil)
    }
  }

  internal func presentSocialViewController(socialViewController: UIViewController) {
    presentViewController(socialViewController, animated: true, completion: nil)
  }

  func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController!) {
    gameCenterViewController.dismissViewControllerAnimated(true, completion: nil)
  }

  internal func showSocialButtons() {
    mainButton!.singleTapEnabled(true)
    mainButton!.doubleTapEnabled(true)
    progressBar!.hidden = true
    facebookButton!.hidden = false
    twitterButton!.hidden = false
    leaderboardButton!.hidden = false
  }

  internal func hideSocialButtons() {
    progressBar!.hidden = false
    facebookButton!.hidden = true
    twitterButton!.hidden = true
    leaderboardButton!.hidden = true
  }
  
}
