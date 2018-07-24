//
//  EnteringDataController.swift
//  QRSMedia
//
//  Created by Emily Lam on 7/23/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import Foundation
import UIKit

class DetailedSocialMediaViewController: UIViewController {
    
    var cellSocialMediaInfo: SocialMediaInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        companyLogoImageView.image = cellSocialMediaInfo.image
        companyNameLabel.text = cellSocialMediaInfo.companyTitle
        enterUsernameTextField.text = cellSocialMediaInfo.username
    }
    
    @IBOutlet weak var companyLogoImageView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var enterUsernameTextField: UITextField!
}
