//
//  AlbumListController.swift
//  DKrebs_FinalProjectPhotoAlbumApp
//
//  Created by user165127 on 3/14/20.
//  Copyright © 2020 DePaul University CDM. All rights reserved.
//

import UIKit

let albums = [Album(name: "Chicago", description: "Some photos of the city"), Album(name: "Vacation", description: "Some photos from my vacation")]

class AlbumListController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        loadImages()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let album = albums[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "album", for: indexPath)

        cell.textLabel?.text = album.name
        cell.detailTextLabel?.text = album.description

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let detailViewController = segue.destination as? AlbumViewController {
            if let indexPath = self.tableView.indexPathForSelectedRow{
                detailViewController.album = albums[indexPath.row]
            }
        }
    }
    
    func loadImages(){
        let photo = Photo(name: "The Bean", date: Date(), caption: "The name of this sculpture is actually called Cloudgate", image: UIImage(named: "TheBean.jpg")!)
        let photo2 = Photo(name: "GrantPark", date: Date(), caption: "Grant Park is the location of a lot of Chicago festivals such as Lollapalooza and The Taste of Chicago", image: UIImage(named: "GrantPark.jpg")!)
        let photo3 = Photo(name: "ChicagoTheatre", date: Date(), caption: "The Chicago Theatre marquee is often used as a stock photo for Chicago and is a big spot for Instagrammers ;)", image: UIImage(named: "ChicagoTheatre.jpg")!)
        
        albums[0].addPhoto(photo: photo)
        albums[0].addPhoto(photo: photo2)
        albums[0].addPhoto(photo: photo3)
        
        let photoV1 = Photo(name: "Canals", date: Date(), caption: "The canals in Amsterdam", image: UIImage(named: "Canal.jpg")!)
        let photoV2 = Photo(name: "Bikes", date: Date(), caption: "There are a lot of bikes everywhere in Amsterdam", image: UIImage(named: "Bikes.jpg")!)
        let photoV3 = Photo(name: "The Ruks Museum", date: Date(), caption: "The Ruks Museum in Amsterdam has over 1000 years of European art and history. It took us over 4 hours to get through the whole thing", image: UIImage(named: "Ruks.jpg")!)
        
        albums[1].addPhoto(photo: photoV1)
        albums[1].addPhoto(photo: photoV2)
        albums[1].addPhoto(photo: photoV3)
    }

}
