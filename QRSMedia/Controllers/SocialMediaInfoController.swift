//
//  SocialMediaInfoController.swift
//  QRSMedia
//
//  Created by Emily Lam on 7/22/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import UIKit

class SocialMediaInfoController: UIViewController, UITableViewDataSource {
    
    @IBAction func test(_ sender: UIButton) {
        print("test")
    }
    
    var cellSocialMediaInfo: SocialMediaInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        companyUserData.loadFromUserDefaults()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //check if user has already opened app
        
        let ud = UserDefaults.standard
        if ud.bool(forKey: "hasUserAlreadyOpendAppBefore") == false {
            self.performSegue(withIdentifier: "toIntroductionScreen", sender: nil)
            ud.set(true, forKey: "hasUserAlreadyOpendAppBefore")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    let companyUserData = CompanyUserData()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companyUserData.allSocialMediaInfos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CompanyDataCell
        
        let socialMediaInfo = companyUserData.allSocialMediaInfos[indexPath.row]
        
        cell.companyName.text = socialMediaInfo.companyTitle
        cell.logoImageView.image = socialMediaInfo.image
        cell.usernameLabel.text = socialMediaInfo.username
        cell.contentView.backgroundColor = colorForIndex(index: indexPath.row)
        
        return cell
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        let areYouSure = UIAlertController(title: "Are you sure?", message: "All usernames will be cleared", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Cancel", style: .default) { (_) in
            
        }
                
        let keepGoing = UIAlertAction(title: "Continue", style: .default) { (_) in
            self.companyUserData.resetUsernameValues()
            self.tableView.reloadData()
        }
        areYouSure.addAction(cancel)
        areYouSure.addAction(keepGoing)
        
        self.present(areYouSure, animated: true)
    }
    
//Creates the color functions for cells background
    func colorForIndex(index: Int) -> UIColor {
        let itemCount = companyUserData.allSocialMediaInfos.count - 1
        print(itemCount)
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.9
        return UIColor(red: color, green: 0.2, blue: 0.5, alpha: 0.6)
    }
//Sets the cell's background color
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell,
                            forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = colorForIndex(index: indexPath.row)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func appInstructionsDidTap(_ sender: Any) {
        let alertAppInstructions = UIAlertController(title: "How to generate QR code", message: "message", preferredStyle: .alert)
        let dismissButton = UIAlertAction(title: "Dismiss", style: .default)
        alertAppInstructions.addAction(dismissButton)
        
        self.present(alertAppInstructions, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {return}
        
        switch identifier {
        case "displayData":
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let cellSocialMediaInfo = companyUserData.allSocialMediaInfos[indexPath.row]
            let destination = segue.destination as! DetailedSocialMediaViewController
            destination.cellSocialMediaInfo = cellSocialMediaInfo
            
        default:
            print("ya ya ya")
        }
    }
}

