//
//  Photo.swift
//  DKrebs_FinalProjectPhotoAlbumApp
//
//  Created by user165127 on 3/14/20.
//  Copyright © 2020 DePaul University CDM. All rights reserved.
//

import Foundation
import  UIKit

class Photo {
    
    var name: String
    var date: Date
    var caption: String
    var image: UIImage
    
    init(name: String, date: Date, caption: String, image: UIImage){
        self.name = name
        self.date = date
        self.caption = caption
        self.image = image
    }
    
    func editName(name: String){
        self.name = name
    }
    
    func editCaption(caption: String){
        self.caption = caption
    }
}
