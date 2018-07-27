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

        //Listen for keyboard events
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)

    }
    //code to dismiss function in swift 1
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        self.view.endEditing(true)
//        return false
//    }

    @IBAction func cancelButtonTapped(_ sender: Any) {

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

    @IBAction func saveButtonTapped(_ sender: Any) {

        //update the username from the textfield into the cellSocialMediaInfo.username
        cellSocialMediaInfo.username = enterUsernameTextField.text ?? ""

        //go back to the Home screen
        navigationController!.popViewController(animated: true)

//        username?.username = enterUsernameTextField.text
//        CoreDataHelper.saveUsername()

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
                view.frame.origin.y = -keyboardRect.height
        } else {
            view.frame.origin.y = 0

        }
    }
}
