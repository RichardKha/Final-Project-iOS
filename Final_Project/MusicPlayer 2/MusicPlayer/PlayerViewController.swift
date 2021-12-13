//
//  PlayerViewController.swift
//  MusicPlayer
//
//  Created by Brandon Busquets and Richard Kha.
//
import AVFoundation
import UIKit

class PlayerViewController: UIViewController {

    public var position: Int = 0
    public var songs: [Song] = []
    
    @IBOutlet var holder: UIView!
    
    var player: AVAudioPlayer?
    
    //ui elements
    
    private let albumImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let songNameLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let artistNameLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let albumNameLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    let playPauseButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if holder.subviews.count == 0 {
            configure()
        }
    }

    func configure() {
        //set up player
        let song = songs[position]
        let urlString = Bundle.main.path(forResource: song.trackName, ofType: "mp3")
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            guard let urlString = urlString else {
                return
            }
            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
            
            guard let player = player else {
                return
            }
            player.volume = 0.5
            player.play()
        }
        catch {
            print("error occured")
        }
        //set up ui elements
        
        //album cover
        albumImageView.frame = CGRect(x: 10,
                                      y: 10,
                                      width: holder.frame.size.width - 20,
                                      height: holder.frame.size.width - 20)
        albumImageView.image = UIImage(named: song.imageName)
        holder.addSubview(albumImageView)
        
        albumImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraintx = albumImageView.centerXAnchor.constraint(equalTo: holder.centerXAnchor)
        let constrainty = albumImageView.centerYAnchor.constraint(equalTo: holder.centerYAnchor)
        let constraintl = albumImageView.leadingAnchor.constraint(equalTo: holder.leadingAnchor, constant: 50)
        let constraintt = albumImageView.trailingAnchor.constraint(equalTo: holder.trailingAnchor, constant: -50)
        let constrainttop = albumImageView.topAnchor.constraint(equalTo: holder.topAnchor, constant: 60)
        let constraintbot = albumImageView.bottomAnchor.constraint(equalTo: holder.bottomAnchor, constant: -400)
        
        constraintx.isActive = true
        constrainty.isActive = true
        constraintl.isActive = true
        constraintt.isActive = true
        constrainttop.isActive = true
        constraintbot.isActive = true
        
        songNameLabel.frame = CGRect(x: 10,
                                     y: albumImageView.frame.size.height + 10,
                                      width: holder.frame.size.width - 20,
                                      height: 70)
        
        albumNameLabel.frame = CGRect(x: 10,
                                      y: albumImageView.frame.size.height + 10 + 70,
                                      width: holder.frame.size.width - 20,
                                      height: 70)
        
        artistNameLabel.frame = CGRect(x: 10,
                                      y: albumImageView.frame.size.height + 10 + 140,
                                      width: holder.frame.size.width - 20,
                                      height: 70)
        
        
        //Labels
        
        songNameLabel.text = song.name
        albumNameLabel.text = song.albumName
        artistNameLabel.text = song.artistName
        
        holder.addSubview(songNameLabel)
        holder.addSubview(albumNameLabel)
        holder.addSubview(artistNameLabel)
        
        
        songNameLabel.translatesAutoresizingMaskIntoConstraints = false
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let labelx = songNameLabel.centerXAnchor.constraint(equalTo: holder.centerXAnchor)
        let labely = songNameLabel.centerYAnchor.constraint(equalTo: holder.centerYAnchor)
        let labell = songNameLabel.leadingAnchor.constraint(equalTo: holder.leadingAnchor, constant: 50)
        let labelt = songNameLabel.trailingAnchor.constraint(equalTo: holder.trailingAnchor, constant: -50)
        let labeltop = songNameLabel.topAnchor.constraint(equalTo: albumImageView.topAnchor, constant: 70)
        let labelbot = songNameLabel.bottomAnchor.constraint(equalTo: holder.bottomAnchor, constant: -140)
        
        let albumx = albumNameLabel.centerXAnchor.constraint(equalTo: holder.centerXAnchor)
        let albumy = albumNameLabel.centerYAnchor.constraint(equalTo: holder.centerYAnchor)
        let albuml = albumNameLabel.leadingAnchor.constraint(equalTo: holder.leadingAnchor, constant: 50)
        let albumt = albumNameLabel.trailingAnchor.constraint(equalTo: holder.trailingAnchor, constant: -50)
        let albumtop = albumNameLabel.topAnchor.constraint(equalTo: songNameLabel.topAnchor, constant: 70)
        let albumbot = albumNameLabel.bottomAnchor.constraint(equalTo: holder.bottomAnchor, constant: -120)
        
        let artistx = artistNameLabel.centerXAnchor.constraint(equalTo: holder.centerXAnchor)
        let artisty = artistNameLabel.centerYAnchor.constraint(equalTo: holder.centerYAnchor)
        let artistl = artistNameLabel.leadingAnchor.constraint(equalTo: holder.leadingAnchor, constant: 50)
        let artistt = artistNameLabel.trailingAnchor.constraint(equalTo: holder.trailingAnchor, constant: -50)
        let artisttop = artistNameLabel.topAnchor.constraint(equalTo: albumNameLabel.topAnchor, constant: 70)
        let artistbot = artistNameLabel.bottomAnchor.constraint(equalTo: holder.bottomAnchor, constant: -100)
        
        labelx.isActive = true
        labely.isActive = true
        labell.isActive = true
        labelt.isActive = true
        labeltop.isActive = true
        labelbot.isActive = true
        
        albumx.isActive = true
        albumy.isActive = true
        albuml.isActive = true
        albumt.isActive = true
        albumtop.isActive = true
        albumbot.isActive = true
        
        artistx.isActive = true
        artisty.isActive = true
        artistl.isActive = true
        artistt.isActive = true
        artisttop.isActive = true
        artistbot.isActive = true
        
        //Player controls
       
        let nextButton = UIButton()
        
        let backButton = UIButton()
        
        //images
        playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        
        
        backButton.setBackgroundImage(UIImage(systemName: "backward.fill"), for: .normal)
        
        nextButton.setBackgroundImage(UIImage(systemName: "forward.fill"), for: .normal)
        
        //frames
        let yPosition = artistNameLabel.frame.origin.y + 70 + 20
        let size: CGFloat = 70
        
        playPauseButton.frame = CGRect(x: (holder.frame.size.width - size) / 2.0,
                                       y: yPosition,
                                       width: size,
                                       height: size)
        
        nextButton.frame = CGRect(x: holder.frame.size.width - size - 20,
                                       y: yPosition,
                                       width: size,
                                       height: size)
        
        backButton.frame = CGRect(x: 20,
                                       y: yPosition,
                                       width: size,
                                       height: size)
        
        //actions
        playPauseButton.addTarget(self, action: #selector(didTapPlayPausebutton), for: .touchUpInside)
        
        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        
        //styling
        playPauseButton.tintColor = .black
        backButton.tintColor = .black
        nextButton.tintColor = .black
        
        holder.addSubview(playPauseButton)
        holder.addSubview(nextButton)
        holder.addSubview(backButton)
        
        playPauseButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        let playx = playPauseButton.centerXAnchor.constraint(equalTo: holder.centerXAnchor)
        let playy = playPauseButton.centerYAnchor.constraint(equalTo: holder.centerYAnchor)
        let playl = playPauseButton.leadingAnchor.constraint(equalTo: holder.leadingAnchor, constant: 130)
        let playt = playPauseButton.trailingAnchor.constraint(equalTo: holder.trailingAnchor, constant: -130)
        let playtop = playPauseButton.topAnchor.constraint(equalTo: artistNameLabel.topAnchor, constant: 150)
        let playbot = playPauseButton.bottomAnchor.constraint(equalTo: holder.bottomAnchor, constant: -50)
        
        let nextx = nextButton.centerXAnchor.constraint(equalTo: holder.centerXAnchor)
        let nexty = nextButton.centerYAnchor.constraint(equalTo: holder.centerYAnchor)
        let nextl = nextButton.leadingAnchor.constraint(equalTo: playPauseButton.leadingAnchor, constant: 100)
        let nextt = nextButton.trailingAnchor.constraint(equalTo: holder.trailingAnchor, constant: -40)
        let nexttop = nextButton.topAnchor.constraint(equalTo: artistNameLabel.topAnchor, constant: 150)
        let nextbot = nextButton.bottomAnchor.constraint(equalTo: holder.bottomAnchor, constant: -50)
        
        let backx = backButton.centerXAnchor.constraint(equalTo: holder.centerXAnchor)
        let backy = backButton.centerYAnchor.constraint(equalTo: holder.centerYAnchor)
        let backl = backButton.leadingAnchor.constraint(equalTo: holder.leadingAnchor, constant: 40)
        let backt = backButton.trailingAnchor.constraint(equalTo: playPauseButton.trailingAnchor, constant: -100)
        let backtop = backButton.topAnchor.constraint(equalTo: artistNameLabel.topAnchor, constant: 150)
        let backbot = backButton.bottomAnchor.constraint(equalTo: holder.bottomAnchor, constant: -50)
        
        playx.isActive = true
        playy.isActive = true
        playl.isActive = true
        playt.isActive = true
        playtop.isActive = true
        playbot.isActive = true
        
        nextx.isActive = true
        nexty.isActive = true
        nextl.isActive = true
        nextt.isActive = true
        nexttop.isActive = true
        nextbot.isActive = true
        
        backx.isActive = true
        backy.isActive = true
        backl.isActive = true
        backt.isActive = true
        backtop.isActive = true
        backbot.isActive = true
        
        //slider
        
        
        let slider = UISlider(frame: CGRect(x: 20, y: holder.frame.size.height - 60, width: holder.frame.size.width-40, height: 50))
        slider.value = 0.5
        slider.addTarget(self, action: #selector(didSlideSlider(_:)), for: .valueChanged)
        holder.addSubview(slider)
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        let sliderx = slider.centerXAnchor.constraint(equalTo: holder.centerXAnchor)
        let slidery = slider.centerYAnchor.constraint(equalTo: holder.centerYAnchor)
        let sliderl = slider.leadingAnchor.constraint(equalTo: holder.leadingAnchor, constant: 40)
        let slidert = slider.trailingAnchor.constraint(equalTo: holder.trailingAnchor, constant: -40)
        let slidertop = slider.topAnchor.constraint(equalTo: playPauseButton.topAnchor, constant: 60)
        let sliderbot = slider.bottomAnchor.constraint(equalTo: holder.bottomAnchor, constant: -10)
        
        sliderx.isActive = true
        slidery.isActive = true
        sliderl.isActive = true
        slidert.isActive = true
        slidertop.isActive = true
        sliderbot.isActive = true
        
    }
    
    @objc func didTapBackButton(){
        if position > 0 {
            position = position - 1
            player?.stop()
            for subview in holder.subviews{
                subview.removeFromSuperview()
            }
            configure()
        }
        
        
    }
    
    @objc func didTapNextButton(){
        if position < songs.count - 1 {
            position = position + 1
            player?.stop()
            for subview in holder.subviews{
                subview.removeFromSuperview()
            }
            configure()
        }
        
    }
    
    @objc func didTapPlayPausebutton(){
        if player?.isPlaying == true {
            //pause
            player?.pause()
            //show play button
            playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
        }
        else
        {
            //play
            player?.play()
            
        playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
        
    }
    
    @objc func didSlideSlider(_ slider: UISlider) {
        let value = slider.value
        player?.volume = value
        //adjust player volume
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player {
            player.stop()
        }
    }
    
    
}
