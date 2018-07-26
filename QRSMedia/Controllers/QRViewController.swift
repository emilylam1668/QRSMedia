//
//  QRViewController.swift
//  QRSMedia
//
//  Created by Emily Lam on 7/23/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import UIKit

class QRViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func shareQRButtonTapped(_ sender: Any) {
        
        let alertSaveQR = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
//        let alertSaveQR = UIAlertController(title: "", message: "", preferredStyle: )
        let saveImage = UIAlertAction(title: "Save Image", style: .default)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertSaveQR.addAction(saveImage)
        alertSaveQR.addAction(cancel)
        
        self.present(alertSaveQR, animated: true)
    }
    
}
