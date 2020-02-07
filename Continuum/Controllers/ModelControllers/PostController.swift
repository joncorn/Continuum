//
//  PostController.swift
//  Continuum
//
//  Created by Jon Corn on 2/5/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import Foundation
import CloudKit

// MARK: - PostController class
class PostController {
  
  // MARK: Properties
  static let shared = PostController()
  var posts = [Post]()
  
  // MARK: - CRUD Functions
  func addComment(withText text: String, forPost post: Post, completion: @escaping (Comment?) -> Void) {
    let comment = Comment(text: text, post: post)
    post.comments.append(comment)
  }
}
