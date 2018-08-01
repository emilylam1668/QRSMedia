//
//  QRViewController.swift
//  QRSMedia
//
//  Created by Emily Lam on 7/23/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import UIKit

extension UIView {
    
    func snapshotImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0.0)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let resultingImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resultingImage!
    }
}

class QRViewController: UIViewController, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        companyUserData.loadFromUserDefaults()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        //DID LOAD OR WILL APPEAR
        let screenshotImage = self.screenshotView.snapshotImage()
        MediaService.create(for: screenshotImage) { (urlOfImage) in
            
        }
    }
    
    
    
    let companyUserData = CompanyUserData()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companyUserData.allSocialMediaInfos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SSCustomCell") as! SSCompanyDataCell
        
        let socialMediaInfo = companyUserData.allSocialMediaInfos[indexPath.row]
        
        cell.SScompanyName.text = socialMediaInfo.companyTitle
        cell.SSlogoImageView.image = socialMediaInfo.image
        cell.SSusernameLabel.text = socialMediaInfo.username
        
        return cell
    }
    
    @IBOutlet var screenshotView: UIView!
    @IBOutlet weak var tableView: UITableView!

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
