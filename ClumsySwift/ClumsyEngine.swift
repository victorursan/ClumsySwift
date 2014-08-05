//
//  ClumsyEngine.swift
//  ClumsySwift
//
//  Created by Victor Ursan on 7/28/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit

protocol ClumsyEngineDelegate {
  func setClumsyActionView(action: Action)
  func failedWithScore(score: Int)
  func incrementProgressViewWith(amount: Float, reset: Bool)
}

class ClumsyEngine: NSObject {
  private var score: Int
  private var actionTimer: NSTimer = NSTimer()
  private var progressTimer: NSTimer = NSTimer()
   var action: Action?
  private var delegate: ClumsyEngineDelegate
  private var roundTime: Double = 1.2
  private var time: Double = 1.2
  
  required init(coder: NSCoder) {
    fatalError("NSCoding not supported")
  }
  
  init(target: ClumsyEngineDelegate) {
    score = 0
    delegate = target
    roundTime = 1.2
    super.init()
  }
  
  internal func failedAction() {
    stopTimer()
    delegate.failedWithScore(score)
  }

  internal func start() {
    score = 0
    roundTime = 1.2
    newClumsyAction()
    startTimer()
    
  }
  
  internal func increment() {
    delegate.incrementProgressViewWith(Float(time/60.0) , reset: false)
  }
  
  internal func verifyClumsyAction(clumsyAction: Action) {
    if (clumsyAction == action) {
      resetTimer()
      newClumsyAction()
      score++
    } else {
      failedAction()
    }
  }

  private func newClumsyAction() {
    action = randomAction()
    (action == Action.Shake) ? (time = 1.2) : (time = roundTime)
    roundTime -= 0.005;
    delegate.setClumsyActionView(action!)
  }
  
  private func startTimer() {
    actionTimer = NSTimer.scheduledTimerWithTimeInterval(time, target: self, selector: "failedAction", userInfo: nil, repeats: false)
    progressTimer = NSTimer.scheduledTimerWithTimeInterval(time/60.0, target: self, selector: "increment", userInfo: nil, repeats: true)
  }
  
  private func stopTimer() {
    actionTimer.invalidate()
    progressTimer.invalidate()
    delegate.incrementProgressViewWith(Float(time/60.0) , reset: true)
  }
  
  private func resetTimer() {
    stopTimer()
    NSThread.sleepForTimeInterval(0.15)
    startTimer()
  }

}
