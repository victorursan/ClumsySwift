//
//  ClumsySwipeGestureRecognizer.swift
//  ClumsySwift
//
//  Created by Victor Ursan on 7/27/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit

protocol ClumsySwipeGestureRecognizerDelegate {
  func screenWasSwiped(swipe: UISwipeGestureRecognizer)
}

class ClumsySwipeGestureRecognizer: UISwipeGestureRecognizer {
  
  required init(coder: NSCoder) {
    fatalError("NSCoding not supported")
  }
  
  init(direction: UISwipeGestureRecognizerDirection, target:AnyObject) {
    super.init(target: target, action: "screenWasSwiped:")
    numberOfTouchesRequired = 1
    self.direction=direction
    enabled = false
  }
  
}
