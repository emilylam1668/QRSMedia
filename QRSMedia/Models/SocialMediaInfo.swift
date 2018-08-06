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
    
    var weibo = SocialMediaInfo(image: #imageLiteral(resourceName: "icons8-weibo"), companyTitle: "Weibo")
    var youtube = SocialMediaInfo(image: #imageLiteral(resourceName: "icons8-youtube"), companyTitle: "YouTube")
    var tumblr = SocialMediaInfo(image: #imageLiteral(resourceName: "icons8-tumblr"), companyTitle: "Tumblr")
    var skype = SocialMediaInfo(image: #imageLiteral(resourceName: "icons8-skype"), companyTitle: "Skype")
    var whatsapp = SocialMediaInfo(image: #imageLiteral(resourceName: "icons8-whatsapp"), companyTitle: "WhatsApp")
    
    func loadFromUserDefaults() {
        for item in allSocialMediaInfos {
            let ud = UserDefaults.standard
            let key = item.companyTitle
            if let usernameSavedInUserDefaults = ud.string(forKey: key) {
                item.username = usernameSavedInUserDefaults
            }
        }
    }
    
    func resetUsernameValues() {
        let ud = UserDefaults.standard
        
        for aCompany in self.allSocialMediaInfos {
            ud.set(nil, forKey: aCompany.companyTitle)
            aCompany.username = ""
        }
        ud.synchronize()
    }
    
    var allSocialMediaInfos: [SocialMediaInfo] {
        return [snapchat, instagram, facebook, twitter, linkedin, wechat, spotify, discord, weibo, youtube, tumblr, skype, whatsapp]
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
