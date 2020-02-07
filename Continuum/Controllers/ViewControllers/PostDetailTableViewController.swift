//
//  PostDetailTableViewController.swift
//  Continuum
//
//  Created by Jon Corn on 2/6/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {
  
  // MARK: - Properties
  var post: Post? {
    didSet {
      updateViews()
    }
  }
  
  // MARK: - Outlets
  @IBOutlet weak var photoImageView: UIImageView!
  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - Actions
  @IBAction func commentButtonTapped(_ sender: Any) {
    let alertController = UIAlertController(title: "Add comment", message: nil, preferredStyle: .alert)
    alertController.addTextField { (textField) in
      textField.placeholder = "Enter comment..."
    }
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
    let commentAction = UIAlertAction(title: "Comment", style: .default) { (_) in
      guard let commentText = alertController.textFields?.first?.text,
        !commentText.isEmpty,
        let post = self.post else {return}
      PostController.shared.addComment(withText: commentText, forPost: post, completion: { (comment) in
      })
      self.tableView.reloadData()
    }
    alertController.addAction(cancelAction)
    alertController.addAction(commentAction)
    self.present(alertController, animated: true, completion: nil)
  }
  
  @IBAction func shareButtonTapped(_ sender: Any) {
  }
  @IBAction func followPostButtonTapped(_ sender: Any) {
  }
  
  // MARK: - Methods
  func updateViews() {
    loadViewIfNeeded()
    guard let post = post else {return}
    photoImageView.image = post.photo
    tableView.reloadData()
  }
  
  // MARK: - Table view data source
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return post?.comments.count ?? 0
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)
    let comment = post?.comments[indexPath.row]
    cell.textLabel?.text = comment?.text
    
    return cell
  }
  
  
  /*
   // Override to support conditional editing of the table view.
   override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the specified item to be editable.
   return true
   }
   */
  
  /*
   // Override to support editing the table view.
   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
   if editingStyle == .delete {
   // Delete the row from the data source
   tableView.deleteRows(at: [indexPath], with: .fade)
   } else if editingStyle == .insert {
   // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
   }
   }
   */
  
  /*
   // Override to support rearranging the table view.
   override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
   
   }
   */
  
  /*
   // Override to support conditional rearranging of the table view.
   override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the item to be re-orderable.
   return true
   }
   */
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
