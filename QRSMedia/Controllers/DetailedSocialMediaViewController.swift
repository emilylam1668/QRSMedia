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

    var gradientLayer: CAGradientLayer!
    
    @IBOutlet weak var gradientView: UIView!
    // MARK: - IBOutlets
    @IBOutlet weak var companyLogoImageView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var enterUsernameTextField: UITextField!

    // MARK: - Properties
    var cellSocialMediaInfo: SocialMediaInfo!
//    var username: Username?

    override func viewDidLoad() {
        super.viewDidLoad()

        createGradientLayer()
//        gradientView.backgroundColor = UIColor
//        self.view.layer.addSublayer(gradient)
    
        companyLogoImageView.image = cellSocialMediaInfo.image
        companyNameLabel.text = cellSocialMediaInfo.companyTitle
        enterUsernameTextField.text = cellSocialMediaInfo.username

        //Listen for keyboard events
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)

    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        createGradientLayer()
//    }
    
    //code to dismiss function in swift 1
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        
        let pink = UIColor(red: 188/255.0, green: 100/255.0, blue: 146/255.0, alpha: 1)
        let blue = UIColor(red: 94/255.0, green: 122/255.0, blue: 168/255.0, alpha: 1)
        
        gradientLayer.colors = [blue.cgColor, pink.cgColor]
        gradientView.layer.addSublayer(gradientLayer)
    }

    @IBAction func cancelButtonTapped(_ sender: Any) {
        if enterUsernameTextField.text == cellSocialMediaInfo.username {
            navigationController!.popViewController(animated: true)
        }
        else {
            let alertLeavePage = UIAlertController(title: "Are you sure?", message: "If you go back now, your username changes won't be saved.", preferredStyle: .actionSheet)
            let discardChanges = UIAlertAction(title: "Discard Changes", style: .destructive, handler: { action in
                popVC()
            })
            let stayOnPage = UIAlertAction(title: "Cancel", style: .cancel)

            alertLeavePage.addAction(discardChanges)
            alertLeavePage.addAction(stayOnPage)

            self.present(alertLeavePage, animated: true)

            func popVC() {
                navigationController!.popViewController(animated: true)
            }
        }
    }

    @IBAction func saveButtonTapped(_ sender: Any) {

        //update the username from the textfield into the cellSocialMediaInfo.username
        cellSocialMediaInfo.username = enterUsernameTextField.text ?? ""

        //go back to the Home screen
        navigationController!.popViewController(animated: true)

        let ud = UserDefaults.standard

        let key = cellSocialMediaInfo.companyTitle
        if let value = enterUsernameTextField.text {
            //save the value for the given key into user defaults
            ud.set(value, forKey: key)

            ud.synchronize()

        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }


    @objc func keyboardWillChange(notification: Notification) {
        print("Keyboard will show: \(notification.name.rawValue)")

        guard let keyboardRect = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }

        if notification.name == Notification.Name.UIKeyboardWillShow ||
            notification.name == Notification.Name.UIKeyboardWillChangeFrame {
                view.frame.origin.y = -keyboardRect.height + 64
        } else {
            view.frame.origin.y = 0
        }
    }
}
