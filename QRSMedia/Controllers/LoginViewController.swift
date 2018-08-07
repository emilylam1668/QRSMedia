//
//  LoginViewController.swift
//  QRSMedia
//
//  Created by Emily Lam on 8/5/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    var gradientLayer: CAGradientLayer!
    
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var insturctionsButton: UIButton!
    @IBOutlet weak var QRSMLogoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGradientLayer()

        self.QRSMLogoImage.image = #imageLiteral(resourceName: "qrsm-transparent")
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        self.presentingViewController!.dismiss(animated: true)
    }
    
    @IBAction func instructionsButtonTapped(_ sender: UIButton) {
        let alertAppInstructions = UIAlertController(title: "How to generate QR code", message: "Click on each row to edit the displayed username. If you don't use a social media platform, you may leave it blank. Press on create QR code to generate your own QR and save it to your camera roll to share with others!", preferredStyle: .alert)
        let dismissButton = UIAlertAction(title: "Dismiss", style: .default)
        alertAppInstructions.addAction(dismissButton)
        
        self.present(alertAppInstructions, animated: true)
    }
    
    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        
        let pink = UIColor(red: 188/255.0, green: 100/255.0, blue: 146/255.0, alpha: 1)
        let blue = UIColor(red: 94/255.0, green: 122/255.0, blue: 168/255.0, alpha: 1)
        
        gradientLayer.colors = [blue.cgColor, pink.cgColor]
        gradientView.layer.addSublayer(gradientLayer)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
