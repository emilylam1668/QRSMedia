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
    }
    
    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        
        let pink = UIColor(red: 188/255.0, green: 100/255.0, blue: 146/255.0, alpha: 1)
        let blue = UIColor(red: 94/255.0, green: 122/255.0, blue: 168/255.0, alpha: 1)
        
        gradientLayer.colors = [blue.cgColor, pink.cgColor]
        gradientView.layer.addSublayer(gradientLayer)
    }
    
}
