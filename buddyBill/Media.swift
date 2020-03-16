//
//  Media.swift
//  buddyBill
//
//  Created by Greta Yu on 3/15/20.
//  Copyright © 2020 dasol. All rights reserved.

//  Based on Kilo-Loco tutorial
import UIKit

struct Media {
    let key: String
    let filename: String
    let data: Data
    let mimeType: String
    
    init?(withImage image: UIImage, forKey key: String) {
        self.key = key
        self.mimeType = "image/jpeg"
        self.filename = "receipt.jpeg"
        
        guard let data = image.jpegData(compressionQuality: 0.7) else { return nil }
        self.data = data
    }
    
}
