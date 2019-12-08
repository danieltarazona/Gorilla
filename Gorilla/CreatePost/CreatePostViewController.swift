//
//  CreatePostViewController.swift
//  Gorilla
//
//  Created by Daniel Tarazona on 12/7/19.
//  Copyright © 2019 Gorilla. All rights reserved.
//

import UIKit

class CreatePostViewController: UIViewController {

  @IBOutlet weak var navigationBar: UINavigationBar!
  @IBOutlet weak var backButton: UIButton!
  @IBOutlet weak var shareButton: UIButton!
  @IBOutlet weak var textView: UITextView!

  var profileImagePicker = UIImagePickerController()
  var imageUpload = UIImage()

  override func viewDidLoad() {
    super.viewDidLoad()

    textView.delegate = self

    dismissKeyboardApp()

    profileImagePicker.delegate = self
    profileImagePicker.allowsEditing = true

    navigationBar?.backgroundColor = AppColors.primaryColor

    backButton.addTarget(
      self,
      action: #selector(backButtonTouched),
      for: .touchUpInside
    )

    shareButton.addTarget(
      self,
      action: #selector(shareButtonTouched),
      for: .touchUpInside
    )
    
  }

  @objc func shareButtonTouched() {
    dismiss(animated: true, completion: nil)
  }

  @objc func backButtonTouched() {
    dismiss(animated: true, completion: nil)
  }

  /**
   - Description: Present the image picker from PhotoLibrary.
   */
  @IBAction func addButtonTouched() {
    profileImagePicker.sourceType = .photoLibrary
    present(profileImagePicker, animated: true)
  }
  
}

extension CreatePostViewController: UITextViewDelegate {

  /**
   - Description: Disable the reply button if text view is empty.
   Tells the delegate that editing of the specified text view has ended.
   - Parameter textView:
   The text view in which editing ended.
   */
  func textViewDidEndEditing(_ textView: UITextView) {
    if textView.text.isEmpty {
      shareButton.isEnabled = false
    } else {
      shareButton.isEnabled = true
    }
  }

  func textViewDidBeginEditing(_ textView: UITextView) {
    textView.text = ""
  }

  func textViewDidChange(_ textView: UITextView) {
    let textTotal = textView.text.count

    if textTotal > 150 {
      shareButton.isEnabled = false
    } else if textTotal <= 150 {
      shareButton.isEnabled = true
    }
  }
}

extension CreatePostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  @objc internal func imagePickerController(
    _ picker: UIImagePickerController,
    didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {

    var selectedImage: UIImage!

    if let image = info[.editedImage] as? UIImage {
      selectedImage = image
    }

    if let image = info[.originalImage] as? UIImage {
      selectedImage = image
    }

    imageUpload = selectedImage

    DispatchQueue.main.async { [weak self] in
      self?.dismiss(animated: true)
    }
  }

  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    DispatchQueue.main.async {
      self.dismiss(animated: true)
    }
  }
}

extension UIViewController {

  @objc func dismissKeyboardApp() {
    view.addGestureRecognizer(
      UITapGestureRecognizer(target: view, action: #selector(view.endEditing(_:)))
    )
  }

}
