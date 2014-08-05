//
//  ClumsyProgressBar.swift
//  ClumsySwift
//
//  Created by Victor Ursan on 7/28/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit

class ClumsyProgressBar: UISlider {

  required init(coder: NSCoder) {
    fatalError("NSCoding not supported")
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    minimumValue = 0.0
    maximumValue = 1.0
    transform = CGAffineTransformMakeScale(1.2, 5.0)
    self.setThumbImage(UIImage(), forState: UIControlState.Normal)
    maximumTrackTintColor = UIColor(white: 0.4, alpha: 0.5)
    minimumTrackTintColor = UIColor.greenColor()
    continuous = true
    hidden = true
  }
  
  internal func incrementSliderWith(amount: Float, reset: Bool) {
    if (!reset) {
      value += amount
    } else {
      value = 0
    }
  }
  
}
