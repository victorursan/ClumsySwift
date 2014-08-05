//
//  ClumsyScoreHandler.swift
//  ClumsySwift
//
//  Created by Victor Ursan on 8/2/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit
import CoreData

class ClumsyScoreHandler: NSObject {
  private var context: NSManagedObjectContext
  private var score: Int
  
  override init() {
    var error: NSError?
    var appDel: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
    context = appDel.managedObjectContext!
    var request = NSFetchRequest(entityName: "ClumsyScore")
    request.returnsObjectsAsFaults = false
    var scoreArray:NSArray = context.executeFetchRequest(request, error: &error)
    
    if (scoreArray.count > 0) {
      score = scoreArray[0].valueForKey("bestScore") as Int
    } else {
      var newScore = NSEntityDescription.insertNewObjectForEntityForName("ClumsyScore", inManagedObjectContext: context) as NSManagedObject
      newScore.setValue(0, forKey: "bestScore")
      score = 0
      context.save(&error)
    }
    super.init()
  }
  
  internal func checkScore(score: Int) {
    var error: NSError?
    if (self.score < score) {
      var error: NSError?
      var request = NSFetchRequest(entityName: "ClumsyScore")
      request.returnsObjectsAsFaults = false
      var scoreArray:NSArray = context.executeFetchRequest(request, error: &error)
      scoreArray[0].setValue(score, forKey: "bestScore")
      context.save(&error)
      self.score = score
    }
  }
  
  internal func bestScore() -> Int {
    return score
  }
  
}
