//
//  PhotoSelectorViewController.swift
//  Continuum
//
//  Created by Jon Corn on 2/6/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import UIKit

protocol PhotoSelectorViewControllerDelegate: class {
  func photoSelectorViewControllerSelected(image: UIImage)
}

class PhotoSelectorViewController: UIViewController {
  
  // MARK: - properties
  weak var delegate: PhotoSelectorViewControllerDelegate?
  
  // MARK: - Outlets
  @IBOutlet weak var photoImageview: UIImageView!
  @IBOutlet weak var selectPhotoButton: UIButton!
  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    photoImageview.image = nil
    selectPhotoButton.setTitle("Select Photo", for: .normal)
  }
  
  // MARK: - Actions
  @IBAction func selectPhotoButtonTapped(_ sender: Any) {
    presentImagePickerActionSheet()
  }
  
  // MARK: - Methods
  func presentImagePickerActionSheet() {
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
    let actionSheet = UIAlertController(title: "Select photo", message: nil, preferredStyle: .actionSheet)
    // Photo library option
    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
      actionSheet.addAction(UIAlertAction(title: "Photos", style: .default, handler: { (_) in
        imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
      }))
    }
    // Camera option
    if UIImagePickerController.isSourceTypeAvailable(.camera) {
      actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (_) in
        imagePickerController.sourceType = UIImagePickerController.SourceType.camera
        self.present(imagePickerController, animated: true, completion: nil)
      }))
    }
    actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    present(actionSheet, animated: true)
  }
}

// MARK: - UIImagePickerControllerDelegate
extension PhotoSelectorViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    picker.dismiss(animated: true, completion: nil)
    if let photo = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
      selectPhotoButton.setTitle("", for: .normal)
      photoImageview.image = photo
      delegate?.photoSelectorViewControllerSelected(image: photo)
    }
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
}
