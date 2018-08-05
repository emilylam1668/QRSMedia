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
    
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var insturctionsButton: UIButton!
    @IBOutlet weak var QRSMLogoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.QRSMLogoImage.image = #imageLiteral(resourceName: "qrsm-transparent")
    }
    
    @IBAction func createButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func instructionsButtonTapped(_ sender: UIButton) {
    }
    
}
