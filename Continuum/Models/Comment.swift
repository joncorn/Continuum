//
//  Comment.swift
//  Continuum
//
//  Created by Jon Corn on 2/5/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import Foundation

// MARK: - Comment Model
class Comment {
  var text: String
  var timestamp: Date
  weak var post: Post?
  
  // Initializer
  init(text: String, timestamp: Date = Date(), post: Post?) {
    self.text = text
    self.timestamp = timestamp
    self.post = post
  }
}
