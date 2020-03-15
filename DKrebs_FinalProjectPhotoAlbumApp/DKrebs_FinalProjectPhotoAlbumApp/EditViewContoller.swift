//
//  EditViewContoller.swift
//  DKrebs_FinalProjectPhotoAlbumApp
//
//  Created by user165127 on 3/15/20.
//  Copyright © 2020 DePaul University CDM. All rights reserved.
//

import UIKit

class EditViewContoller: UIViewController {

    
    @IBOutlet weak var photoName: UITextField!
    @IBOutlet weak var captionText: UITextField!
    
    @IBAction func savePressed(_ sender: UIButton) {
        tempName = photoName.text!
        tempCaption = captionText.text!
        let title = "Photo Updated"
        let message = "Photo details have been saved"
        generateAlert(title: title, message: message)
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        let title = "Changes Cancelled"
        let message = "Changes cancelled, no photo details have been updated"
        generateAlert(title: title, message: message)
        photoName.text = ""
        captionText.text = ""
    }
    
    @IBAction func backgroundTouched(_ sender: UIControl) {
        photoName.resignFirstResponder()
        captionText.resignFirstResponder()
    }
    
    @IBAction func editDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
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
