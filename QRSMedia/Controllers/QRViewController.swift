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
    
    var gradientLayer: CAGradientLayer!

    @IBOutlet weak var qrCodeDisplay: UIImageView!
    @IBOutlet weak var gradientView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGradientLayer()
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
    
    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        
        let pink = UIColor(red: 188/255.0, green: 100/255.0, blue: 146/255.0, alpha: 1)
        let blue = UIColor(red: 94/255.0, green: 122/255.0, blue: 168/255.0, alpha: 1)
        
        gradientLayer.colors = [blue.cgColor, pink.cgColor]
        gradientView.layer.addSublayer(gradientLayer)
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
    
    @IBAction func saveImageButtonTapped(_ sender: Any) {
//        qrCodeDisplay
        guard
            let image = self.qrCodeDisplay.image,
            let imageData = UIImagePNGRepresentation(image),
            let compressedImage = UIImage(data: imageData)
            else {
                return
        }
        
        UIImageWriteToSavedPhotosAlbum(compressedImage, self, #selector(QRViewController.image(image:didFinishSavingWithError:contextInfo:)), nil)
    }
//    - (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo;
    @objc func image(image: UIImage, didFinishSavingWithError: Error, contextInfo: Any?) {
        
        let alert = UIAlertController(title: "Saved", message: "Your QR Code has been saved to your camera roll", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBOutlet var screenshotView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
}
