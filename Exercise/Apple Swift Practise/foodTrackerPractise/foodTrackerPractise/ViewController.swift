//
//  ViewController.swift
//  foodTrackerPractise
//
//  Created by WuKwok Ho on 10/3/2016.
//  Copyright © 2016 Wu Kwok Ho. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imputEmailLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var photoImageView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    // Handle the text field's user input through delegate callbacks.
        emailTextField.delegate = self
        
    }

//MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the Keyboard
        emailTextField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(textField: UITextField) {
        imputEmailLabel.text = textField.text
    }
    
    //MARK: UIImagePickerContollerDelegate
    func imagePickerControllerDidCancel (picker:UIImagePickerController){
        //Dismiss the picker if the user canceled.
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerContoller (picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: AnyObject]){
        //The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set PhotoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    //MARK: Actions
    
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        emailTextField.resignFirstResponder()
        
        //UIImagePickerContoller is a view controller that lets a user pick media from their photo library
        let imagePickerController = UIImagePickerController()
        
        //Only allow photos to be picked, not taken
        imagePickerController.sourceType = .PhotoLibrary
        
        //Make sure ViewController is notified when user picks an image
        imagePickerController.delegate = self
    
        presentViewController(imagePickerController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func setDefaultLabelText(sender: UIButton) {
        imputEmailLabel.text = "Please enter valid email!"
    }
}

