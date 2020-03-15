//
//  Album.swift
//  DKrebs_FinalProjectPhotoAlbumApp
//
//  Created by user165127 on 3/14/20.
//  Copyright © 2020 DePaul University CDM. All rights reserved.
//

import Foundation
import UIKit

class Album {
    
    var name: String
    var description: String
    var photos: [Photo]
    
    init(name: String, description: String){
        self.name = name
        self.description = description
        self.photos = [Photo]()
    }

    func addPhoto(photo: Photo){
        photos.append(photo)
    }
}
