//
//  ClumsyMainButton.swift
//  ClumsySwift
//
//  Created by Victor Ursan on 7/25/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit

protocol ClumsyMainButtonDelegate {
  func screenWasTapped()
  func screenWasDoubleTapped()
}

class ClumsyMainButton: UIButton {
  
  private var singleTap = UITapGestureRecognizer()
  private var doubleTap = UITapGestureRecognizer()
  
  required init(coder: NSCoder) {
    fatalError("NSCoding not supported")
  }
  
  init(frame: CGRect, target: AnyObject) {
    super.init(frame: frame)
    singleTap = UITapGestureRecognizer(target: target, action:"screenWasTapped")
    doubleTap = UITapGestureRecognizer(target: target, action:"screenWasDoubleTapped")
    singleTap.numberOfTapsRequired = 1
    doubleTap.numberOfTapsRequired = 2
    addGestureRecognizer(singleTap)
    addGestureRecognizer(doubleTap)
  }
  
  internal func doubleTapEnabled(bool: Bool) {
    doubleTap.enabled = bool
  }
  
  internal func singleTapEnabled(bool: Bool) {
    singleTap.enabled = bool
  }
  
}
