//
//  ViewController.swift
//  DKrebs_FinalProjectPhotoAlbumApp
//
//  Created by user165127 on 3/14/20.
//  Copyright © 2020 DePaul University CDM. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController {
    
    var album: Album?
    var photo: Photo?
    var photoNum = 0
    
    @IBOutlet weak var photoName: UILabel!
    @IBOutlet weak var photoCaption: UILabel!
    @IBOutlet weak var photoDate: UILabel!
    @IBOutlet weak var AlbumTitle: UINavigationItem!
    @IBOutlet weak var image: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let horizontalSwipeLeftRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(AlbumViewController.handleswipeLeft(_:)))
        horizontalSwipeLeftRecognizer.numberOfTouchesRequired = 1
        horizontalSwipeLeftRecognizer.direction = [.left]
        view.addGestureRecognizer(horizontalSwipeLeftRecognizer)
        
        let horizontalSwipeRightRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(AlbumViewController.handleswipeRight(_:)))
        horizontalSwipeRightRecognizer.numberOfTouchesRequired = 1
        horizontalSwipeRightRecognizer.direction = [.right]
        view.addGestureRecognizer(horizontalSwipeRightRecognizer)
        
        if let a = album {
            AlbumTitle.title = "\(a.name) Photos"
            photo = a.photos[photoNum]
            photoName.text = photo?.name
            photoCaption.text = photo?.caption
            image.image = photo?.image
            photoDate.text = datePrint(date: photo!.date)
        }
        
        tempName = photoName.text!
        tempCaption = photoCaption.text!
            
    }
    
    
    override func viewWillAppear(_ animated: Bool){
        updatePhoto()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        tempName = photoName.text!
        tempCaption = photoCaption.text!
    }
    
    func datePrint(date: Date) -> String {
        let df = DateFormatter()
        df.dateFormat = "MM/dd/yyyy"
        return df.string(from: date)
    }
    
    func updatePhoto(){
        photoName.text = tempName
        photoCaption.text = tempCaption
        album?.photos[photoNum].name = tempName
        album?.photos[photoNum].caption = tempCaption
    }
    
    @objc
    func handleswipeLeft(_ sender: UISwipeGestureRecognizer){
        self.photoNum += 1
        if photoNum >= (album?.photos.count)!{
            let title = "No More Photos"
            let message = "This is the end of the album. There are no more photos in the direciton swiped."
            generateAlert(title: title, message: message)
            photoNum -= 1
        }
        else {
            self.photo = album!.photos[photoNum]
            UIView.transition(with: self.view, duration: 2.0, options: .transitionFlipFromRight, animations: {
                self.image.image = self.photo?.image}, completion: nil)
            photoName.text = photo?.name
            photoCaption.text = photo?.caption
            photoDate.text = datePrint(date: photo!.date)
            tempName = photoName.text!
            tempCaption = photoCaption.text!
        }
        
    }
    
    @objc
    func handleswipeRight(_ sender: UISwipeGestureRecognizer){
        self.photoNum -= 1
        if photoNum < 0 {
            let title = "No More Photos"
            let message = "This is the beginning of the album. There are no photos in the direction swiped."
            generateAlert(title: title, message: message)
            photoNum = 0
        }
        else {
            self.photo = album!.photos[photoNum]
            UIView.transition(with: self.view, duration: 2.0, options: .transitionFlipFromLeft, animations: {
                self.image.image = self.photo?.image}, completion: nil)
            photoName.text = photo?.name
            photoCaption.text = photo?.caption
            photoDate.text = datePrint(date: photo!.date)
            tempName = photoName.text!
            tempCaption = photoCaption.text!
        }
        
    }
    
    func generateAlert(title: String, message: String) {
        let title = title
        let message = message
        let alertController =
        UIAlertController(title: title,
                          message: message,
                          preferredStyle: .alert)
        let cancelAction =
            UIAlertAction(title: "OK",
                          style: .cancel,
                          handler: nil)
        alertController.addAction(cancelAction)
        present(alertController,
                animated: true,
                completion: nil)
    }
    
}

