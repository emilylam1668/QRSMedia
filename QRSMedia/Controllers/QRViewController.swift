//
//  QRViewController.swift
//  QRSMedia
//
//  Created by Emily Lam on 7/23/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import UIKit
import QRCode

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
    @IBOutlet weak var qrCodeDisplay: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        companyUserData.loadFromUserDefaults()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        //DID LOAD OR WILL APPEAR
        let screenshotImage = self.screenshotView.snapshotImage()
        
        MediaService.create(for: screenshotImage) { (urlOfImage) in
            
            let qrCode = QRCode(urlOfImage)
         
            self.qrCodeDisplay.image = qrCode?.image
            self.tableView.reloadData()
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
        cell.contentView.backgroundColor = colorForIndex(index: indexPath.row)
        
        return cell
    }
    
    //Creates the color functions for cells background
    func colorForIndex(index: Int) -> UIColor {
        let itemCount = companyUserData.allSocialMediaInfos.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.9
        return UIColor(red: color, green: 0.2, blue: 0.5, alpha: 0.6)
    }
    //Sets the cell's background color
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell,
                   forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = colorForIndex(index: indexPath.row)
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
