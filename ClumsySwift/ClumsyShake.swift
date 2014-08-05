//
//  ClumsyShake.swift
//  ClumsySwift
//
//  Created by Victor Ursan on 7/27/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit
import CoreMotion

protocol ClumsyShakeDelegate {
  func wasShaken()
}

class ClumsyShake: NSObject {
  
  private var motionManager: CMMotionManager = CMMotionManager()
  private var timer: NSTimer = NSTimer()
  private var oldX, oldY, oldZ: Double
  private var delegate: ClumsyShakeDelegate?
  
  init(target: ClumsyShakeDelegate) {
    self.delegate = target
    (oldX, oldY, oldZ) = (0, 0, 0)
    super.init()
  }
  
  internal func poolAccel() {
    var data = self.motionManager.accelerometerData
    var acceleration: CMAcceleration = CMAcceleration(x: 0, y: 0, z: 0)
    if data?.acceleration != nil {
      acceleration = data.acceleration
    }
    let check = delta(acceleration)
    let (x, y, z) = (check[0], check[1], check[2])
    let threshold = 1.0

    if (x > threshold || y > threshold || z > threshold ) {
      stopDeviceMotion()
      delegate!.wasShaken()
    }
    
  }
  
  internal func startDeviceMotion() {
    motionManager.accelerometerUpdateInterval = 1.0/10.0
    motionManager.startAccelerometerUpdates()
    timer = NSTimer.scheduledTimerWithTimeInterval(motionManager.accelerometerUpdateInterval,
                                            target: self,
                                            selector:"poolAccel",
                                            userInfo: nil,
                                            repeats: true)
  }
  
  internal func stopDeviceMotion() {
    motionManager.stopAccelerometerUpdates()
    motionManager = CMMotionManager()
    timer.invalidate()
    (oldX, oldY, oldZ) = (0, 0, 0)
  }

  private func delta(accel: CMAcceleration) -> [Double] {
    var (deltaX, deltaY, deltaZ ) = (0.0, 0.0, 0.0)
    if ((oldX != 0.0) && (oldY != 0.0) && (oldZ != 0.0)) {
      (deltaX, deltaY, deltaZ) = (fabs(oldX-accel.x), fabs(oldY-accel.y), fabs(oldZ-accel.z))
    }
    (oldX, oldY, oldZ) = (accel.x, accel.y, accel.z)
    return [deltaX, deltaY, deltaZ]
  }
  
}

