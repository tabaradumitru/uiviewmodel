//
//  SelfClosingPopupViewController.swift
//  UIViewModel
//
//  Created by Dumitru Tabara on 10/8/19.
//  Copyright © 2019 Dumitru Tabara. All rights reserved.
//

import UIKit

class SelfClosingPopupViewController: UIViewController {
    @IBOutlet weak var numberOfSecondsLabel: UILabel!
    
    var runCount = 9
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closePopupAfterNSeconds()
    }
    
    func closePopupAfterNSeconds() {
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.changeLabelText(textToPrint: "\(self.runCount)")
            self.runCount -= 1
            
            if self.runCount == -1 {
                timer.invalidate()
                self.dismiss(animated: true)
            }
        }
    }
    
    func changeLabelText(textToPrint: String) {
        self.numberOfSecondsLabel.text = textToPrint
    }
}
