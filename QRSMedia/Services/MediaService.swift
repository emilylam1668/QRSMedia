//
//  MediaService.swift
//  QRSMedia
//
//  Created by Emily Lam on 8/1/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import Foundation
import UIKit
import FirebaseStorage
import FirebaseDatabase

struct MediaService {
    static func create(for image: UIImage, completion: (URL) -> ()) {
        guard let deviceId = UIDevice.current.identifierForVendor?.uuidString else {
            fatalError("no id found")
        }
        
        let imageRef = Storage.storage().reference().child(deviceId + ".jpg")
        StorageService.uploadImage(image, at: imageRef) { (downloadURL) in
            guard let downloadURL = downloadURL else {
                return
            }
            
            let urlString = downloadURL.absoluteString
            print("image url: \(urlString)")
        }
    }
}
