//
//  Post.swift
//  Continuum
//
//  Created by Jon Corn on 2/5/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import UIKit
import CloudKit

// MARK: - Post Model
class Post {
  var photoData: Data?
  var timestamp: Date
  var caption: String
  var commentCount: Int
  var comments: [Comment]
  var photo: UIImage? {
    get {
      guard let photoData = photoData else {return nil}
      return UIImage(data: photoData)
    }
    set {
      photoData = newValue?.jpegData(compressionQuality: 0.5)
    }
  }
  
  // Initializer
  init(photo: UIImage?, caption: String, commentCount: Int = 0, timestamp: Date = Date(), comments: [Comment] = []) {
    self.caption = caption
    self.commentCount = commentCount
    self.timestamp = timestamp
    self.comments = comments
    self.photo = photo
  }
}
