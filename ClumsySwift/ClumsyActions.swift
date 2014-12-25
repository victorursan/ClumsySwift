//
//  ClumsyActions.swift
//  ClumsySwift
//
//  Created by Victor Ursan on 7/25/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit

enum Action:Int {
  case Start = 0
  case SwipeRight
  case SwipeLeft
  case SwipeUp
  case SwipeDown
  case Shake
  case Tap
  case DoubleTap
  func description() -> String {
    switch self {
    case Start:
      return "Start"
    case SwipeRight:
      return "Swipe Right"
    case SwipeLeft:
      return "Swipe Left"
    case SwipeUp:
      return "Swipe Up"
    case SwipeDown:
      return "Swipe Down"
    case Shake:
      return "Shake"
    case Tap:
      return "Tap"
    case DoubleTap:
      return "Double Tap"
    }
  }
}

internal func randomAction()->Action {
  return Action(rawValue: Int(arc4random()%7+1))!
}

let allActions: [Action] = [.Start, .SwipeRight, .SwipeLeft, .SwipeUp, .SwipeDown, .Shake, .Tap, .DoubleTap]