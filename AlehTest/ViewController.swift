//
//  ViewController.swift
//  AlehTest
//
//  Created by Andrew Chernyhov on 16.02.16.
//  Copyright © 2016 Andrei_Chernyshou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imageView)
        imageView.backgroundColor = UIColor.brownColor()
        
//        let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-[imageView]-bottomPadding-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: ["bottomPadding|950": self.view.frame.size.height/2], views: ["imageView":imageView])
        
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target:self, action: "addButtonPressed:")]
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let imageViewHeight = self.view.frame.size.height/2
        
        let heightConstraint = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: imageViewHeight)
        heightConstraint.priority = 950
        
        let topConstraint = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0)
        
        let bottomConstraint = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Bottom, multiplier: 0.5, constant: 0.0)
        
        let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|[imageView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: [:], views: ["imageView":imageView])
        imageView.setContentCompressionResistancePriority(UILayoutPriorityRequired, forAxis: UILayoutConstraintAxis.Vertical)
        
        NSLayoutConstraint.activateConstraints(horizontalConstraints+[bottomConstraint, topConstraint, heightConstraint])
        
    }
    
    func addButtonPressed (sender:UIBarButtonItem){
        
        print("addButtonPressed")
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let actionSheet = UIAlertController.init(title: "Options", message: "Make your choise", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let cancelAction = UIAlertAction.init(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            
            let takePhotoAction = UIAlertAction.init(title: "Take a photo", style: UIAlertActionStyle.Default) { (takePhotoAction) -> Void in
                
                imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }
            actionSheet.addAction(takePhotoAction)
        }
        
        let choosePhoto = UIAlertAction.init(title: "Choose from photo library", style: UIAlertActionStyle.Default) { (choosePhoto) -> Void in
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(imagePicker, animated: true, completion: nil)
            
        }
    
        actionSheet.addAction(cancelAction)
        actionSheet.addAction(choosePhoto)
        self.presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let chosenPhoto = info as Dictionary!
        
        let image = chosenPhoto [UIImagePickerControllerOriginalImage] as! UIImage
        
        self.imageView.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

