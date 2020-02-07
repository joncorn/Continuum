//
//  PostTableViewCell.swift
//  Continuum
//
//  Created by Jon Corn on 2/6/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
  
  // MARK:  Properties
  var post: Post? {
    didSet {
      updateViews()
    }
  }
  
  // MARK: - Outlets
  @IBOutlet weak var postImageView: UIImageView!
  @IBOutlet weak var captionLabel: UILabel!
  @IBOutlet weak var commentCountLabel: UILabel!

  // MARK: - Methods
  func updateViews() {
    if let post = post {
      postImageView.image = post.photo
      captionLabel.text = post.caption
      commentCountLabel.text = "Comments: \(post.commentCount)"
    }
  }
}
