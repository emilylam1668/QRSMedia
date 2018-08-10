//
//  aboutViewController.swift
//  QRSMedia
//
//  Created by Emily Lam on 8/8/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import Foundation
import UIKit

class AboutViewController: UIViewController {
    
    var gradientLayer: CAGradientLayer!
    
    @IBOutlet weak var gradientView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGradientLayer()
    }
    
    @IBAction func qrLink(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://github.com/aschuch/QRCode/blob/master/LICENSE")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func icons8link(_ sender: Any) {
            UIApplication.shared.open(URL(string: "https://icons8.com")! as URL, options: [:], completionHandler: nil)
    }
    
    
    
    
    
    
    
    
    
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        self.presentingViewController!.dismiss(animated: true)
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
