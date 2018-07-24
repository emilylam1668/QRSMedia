//
//  ViewController.swift
//  QRSMedia
//
//  Created by Emily Lam on 7/22/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
//        socialMediaInfo.cell
        
        cell.companyName.text = socialMediaInfo.companyTitle
        cell.logoImageView.image = socialMediaInfo.image
        cell.usernameLabel.text = socialMediaInfo.username
        
        return cell
    }

}

