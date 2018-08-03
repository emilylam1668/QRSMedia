//
//  SocialMediaInfoController.swift
//  QRSMedia
//
//  Created by Emily Lam on 7/22/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import UIKit

class SocialMediaInfoController: UIViewController, UITableViewDataSource {
    
//    var usernames = [Username] () {
//        didSet {
//            tableView.reloadData()
//        }
//    }
    
//    var username: Username?
    
    @IBAction func test(_ sender: UIButton) {
        print("test")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        companyUserData.loadFromUserDefaults()
//        usernames = CoreDataHelper.retrieveUsernames()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
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

