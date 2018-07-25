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
    
    // MARK: - IBOutlets
    @IBOutlet weak var companyLogoImageView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var enterUsernameTextField: UITextField!
    
    // MARK: - Properties
    var cellSocialMediaInfo: SocialMediaInfo!
//    var username: Username?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        companyLogoImageView.image = cellSocialMediaInfo.image
        companyNameLabel.text = cellSocialMediaInfo.companyTitle
        enterUsernameTextField.text = cellSocialMediaInfo.username
   
    }
    
    @IBAction func canelButtonTapped(_ sender: Any) {
        
        //go back to the Home screen
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        //update the username from the textfield into the cellSocialMediaInfo.username
        cellSocialMediaInfo.username = enterUsernameTextField.text ?? ""
        
        //go back to the Home screen
        navigationController!.popViewController(animated: true)
        
//        username?.username = enterUsernameTextField.text
//        CoreDataHelper.saveUsername()
        
    }
    

}
