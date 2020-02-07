//
//  AddPostTableViewController.swift
//  Continuum
//
//  Created by Jon Corn on 2/6/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController {
  
  // MARK: - Properties
  var selectedImage: UIImage?
  
  // MARK: - Outlets
  @IBOutlet weak var captionTextField: UITextField!
  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - Prepare for segue
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toPhotoSelectorVC" {
      let photoSelector = segue.destination as? PhotoSelectorViewController
      photoSelector?.delegate = self
    }
  }
  
  // MARK: - Actions
  @IBAction func addPostButtonTapped(_ sender: Any) {
    
  }
  @IBAction func cancelButtonTapped(_ sender: Any) {
  }
}

// MARK: - PhotoSelectorViewcontrollerDelegate
extension AddPostTableViewController: PhotoSelectorViewControllerDelegate {
  func photoSelectorViewControllerSelected(image: UIImage) {
    selectedImage = image
  }
}
