//
//  SocialMediaInfo.swift
//  QRSMedia
//
//  Created by Emily Lam on 7/23/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import Foundation
import UIKit

class CompanyUserData {
    var snapchat = SocialMediaInfo(image: #imageLiteral(resourceName: "icons8-snapchat_circled_logo"), companyTitle: "Snapchat")
    var instagram = SocialMediaInfo(image: #imageLiteral(resourceName: "icons8-instagram_new"), companyTitle: "Instagram")
    var facebook = SocialMediaInfo(image: #imageLiteral(resourceName: "icons8-facebook"), companyTitle: "Facebook")
    var twitter = SocialMediaInfo(image: #imageLiteral(resourceName: "icons8-twitter"), companyTitle: "Twitter")
    var linkedin = SocialMediaInfo(image: #imageLiteral(resourceName: "icons8-linkedin"), companyTitle: "LinkedIn")
    var wechat = SocialMediaInfo(image: #imageLiteral(resourceName: "icons8-weixing"), companyTitle: "WeChat")
    var spotify = SocialMediaInfo(image: #imageLiteral(resourceName: "icons8-spotify"), companyTitle: "Spotify")
    var discord = SocialMediaInfo(image: #imageLiteral(resourceName: "icons8-discord_logo"), companyTitle: "Discord")
    
    //var kakao
    //var weibo
    //var youtube
    //var tumblr
    //var skype
    //var whatsapp
    
    func loadFromUserDefaults() {
        for item in allSocialMediaInfos {
            let ud = UserDefaults.standard
            let key = item.companyTitle
            if let usernameSavedInUserDefaults = ud.string(forKey: key) {
                item.username = usernameSavedInUserDefaults
            }
        }
    }
    
    var allSocialMediaInfos: [SocialMediaInfo] {
        return [snapchat, instagram, facebook, twitter, linkedin, wechat, spotify, discord]
    }
}

class SocialMediaInfo {
    let image: UIImage
    let companyTitle: String
    var username: String
    
    init(image: UIImage, companyTitle: String) {
        self.image = image
        self.companyTitle = companyTitle
        self.username = ""
    }
}
