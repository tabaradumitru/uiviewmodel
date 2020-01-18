//
//  ViewController.swift
//  UIViewModel
//
//  Created by Dumitru Tabara on 10/5/19.
//  Copyright © 2019 Dumitru Tabara. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var textToSearchField: UITextField!
    @IBOutlet weak var cameraOptions: UISegmentedControl!
    @IBOutlet weak var openCameraButton: UIButton!
        
    var imagePicker: UIImagePickerController! = UIImagePickerController()
    var notificationManager = NotificationManager()
    var cameraImage: UIImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        openCameraButton.layer.cornerRadius = 9
    }

    @IBAction func searchInBrowser(_ sender: UIButton) {
        var defaultText = textToSearchField.text!
        defaultText = defaultText.replacingOccurrences(of: " ", with: "+")
        if let url = URL(string: "http://www.google.com/search?q=" + defaultText) {
            UIApplication.shared.open(url)
        } else {
            print("Could not search!")
        }
    }
        
    @IBAction func pushNotificationPressed(_ sender: UIButton) {
        notificationManager.notifications.append(SimpleNotification())
        notificationManager.schedule()
    }
        
    @IBAction func switchCamera(_ sender: UIButton) {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        
        if cameraOptions.selectedSegmentIndex == 1 {
            imagePicker.cameraDevice = .front
        }

        present(imagePicker, animated: true, completion: nil);
    }
        

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        cameraImage = info[.originalImage] as! UIImage
        
        self.performSegue(withIdentifier: "previewImage", sender: self)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "previewImage" {
            let destinationVC = segue.destination as! ImagePreviewViewController
            destinationVC.image = cameraImage
        }
    }
}

