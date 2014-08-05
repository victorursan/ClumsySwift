//
//  ClumsySocialHandler.swift
//  ClumsySwift
//
//  Created by Victor Ursan on 7/31/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit
import Social

class ClumsySocialHandler: NSObject {
  
  internal func createSocialShareSheetFor(service: SocialButton) -> UIViewController {
    var socialSheet: SLComposeViewController?
    switch service {
    case .FacebookShare:
      socialSheet = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
      socialSheet!.setInitialText("Nobody told you how *clumsy* you are with your mobile device? Check out Clumsy App!")
    case .TwitterShare:
      socialSheet = SLComposeViewController(forServiceType:SLServiceTypeTwitter)
      socialSheet!.setInitialText("RT @clumsyapp: Nobody told you how *clumsy* you are with your mobile device? Check out Clumsy App!")
    default:
      println("Error")
    }
    socialSheet!.addURL(NSURL(string: "https://itunes.apple.com/us/app/clumsy/id800927642?mt=8"))
    return socialSheet!
  }
  
  internal func createSocialScoreSheetFor(service: SocialButton, score: Int) -> UIViewController {
    var socialSheet: SLComposeViewController?
    switch service {
    case .FacebookScore:
      socialSheet = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
      socialSheet!.setInitialText("I made \(score) points before I became *clumsy*. How soon until you become Clumsy?")
    case .TwitterScore:
      socialSheet = SLComposeViewController(forServiceType:SLServiceTypeTwitter)
      socialSheet!.setInitialText("RT @clumsyapp: I made \(score) points before I became *clumsy*. How soon until you become Clumsy?")
    default:
      println("Error")
    }
    socialSheet!.addURL(NSURL(string: "https://itunes.apple.com/us/app/clumsy/id800927642?mt=8"))
    return socialSheet!
  }
  
}
