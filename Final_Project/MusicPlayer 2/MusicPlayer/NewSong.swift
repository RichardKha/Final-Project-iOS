//
//  NewSong.swift
//  MusicPlayer
//
//  Created by Brandon Busquets and Richard Kha.
//

import UIKit

var somesong = songs

class NewSong: UIViewController{
    
    
    
    //Variables for text Fields
    @IBOutlet var song_name : UITextField!
    @IBOutlet var album_name : UITextField!
    @IBOutlet var artist_name : UITextField!
    @IBOutlet var image_name : UITextField!
    @IBOutlet var track_name : UITextField!
    
    //Button function to add new song to the songs array
    @IBAction func addSong (_ sender: UIButton) {
        let a: String = song_name.text!
        let b: String = album_name.text!
        let c: String = artist_name.text!
        let d: String = image_name.text!
        let e: String = track_name.text!
        
        //Append to song array
        somesong.append(Song(name: a,
                          albumName: b,
                          artistName: c,
                          imageName: d,
                          trackName: e))
    
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
