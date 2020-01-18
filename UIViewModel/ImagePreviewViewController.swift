//
//  ImagePreviewViewController.swift
//  UIViewModel
//
//  Created by Dumitru Tabara on 1/3/20.
//  Copyright © 2020 Dumitru Tabara. All rights reserved.
//

import UIKit

class ImagePreviewViewController: UIViewController {
    var image: UIImage = UIImage()
    @IBOutlet weak var cameraImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cameraImage.image = image
    }
    
    @IBAction func returnBackPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
