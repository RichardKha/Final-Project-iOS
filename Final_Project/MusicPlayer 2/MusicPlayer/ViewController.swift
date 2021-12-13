//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Brandon Busquets and Richard Kha.
//

import UIKit

//Global song list
var songs = [Song]()


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
    }
    
    func configureSongs() {
        
        //Add sample songs to song array
        songs.append(Song(name: "Sample Long",
                          albumName: "Sample Music",
                          artistName: "Sample Tech",
                          imageName: "Image",
                          trackName: "sample-9s"))
        
        songs.append(Song(name: "Sample Longer",
                          albumName: "Sample Music",
                          artistName: "Sample Tech",
                          imageName: "Image",
                          trackName: "sample-12s"))
        
        songs.append(Song(name: "Sample Even Longer",
                          albumName: "Sample Music",
                          artistName: "Sample Tech",
                          imageName: "Image",
                          trackName: "sample-15s"))
        
    }
    
    //Function to transition to add new song scene
    @IBAction func nextView(_ sender: UIButton) {
        self.performSegue(withIdentifier: "newSongSegue", sender: self)
    }
    
    
    
    
    //table view to return amount of songs
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    //populate table view cells, set song title and album name, and set text fond and size
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //configure
        let song = songs[indexPath.row]
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //present the player
        let position = indexPath.row
        //songs
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerViewController else {
            return
        }
        
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    }
    
    //variable for delete button
    @IBOutlet var deleteButton : UIButton!
    
    //function to enable editing for deleting songs
    @IBAction func deleteSong(_ sender: UIButton) {
        if table.isEditing {
            deleteButton.setTitle("Delete", for: .normal)
            table.isEditing = false
        } else {
            deleteButton.setTitle("Done", for: .normal)
            table.isEditing = true
        }
    }
    
    //Refresh table for new songs to appear
    @IBAction func refresh(_ sender: UIButton) {
        table.beginUpdates()
        table.insertRows(at: [IndexPath(row: somesong.count-1, section: 0)], with: .left)
        table.endUpdates()
    }
    
    //Function to delete songs from the array and update it in table view
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            songs.remove(at: indexPath.row)
            table.beginUpdates()
            table.deleteRows(at: [indexPath], with: .automatic)
            table.endUpdates()
            
        }
    }
    
    
}

//Structure for our song
struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
}
