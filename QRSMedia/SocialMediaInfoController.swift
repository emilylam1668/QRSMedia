//
//  ViewController.swift
//  QRSMedia
//
//  Created by Emily Lam on 7/22/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
//    var usernames = [Username] () {
//        didSet {
//            tableView.reloadData()
//        }
//    }
    
//    var username: Username?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        return cell
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
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

