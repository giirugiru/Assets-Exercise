//
//  ViewController.swift
//  Assets Exercise
//
//  Created by Gilang Sinawang on 07/12/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var firstButtonLabel: UIButton!
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Sample image on load
        albumImage.image = #imageLiteral(resourceName: "Sample")
    }

    @IBAction func KPopButton(_ sender: Any) {
        playMusic(musicName: "KPOP")
        changeImage(imageName: "KPOP")
    }
    
    @IBAction func JazzButton(_ sender: Any) {
        playMusic(musicName: "JAZZ")
        changeImage(imageName: "JAZZ")
    }
    
    @IBAction func ChillButton(_ sender: Any) {
        playMusic(musicName: "CHILL")
        changeImage(imageName: "CHILL")
    }
    
    // Play Music
    func playMusic(musicName: String) {
        let path = Bundle.main.path(forResource: "\(musicName)", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error")
        }
    }
    
    // Change Image with dissolve transition
    func changeImage(imageName: String) {
        UIView.transition(with: albumImage, duration: 0.7, options: .transitionCrossDissolve, animations: {
            self.albumImage.image = UIImage(named: "\(imageName)")
        }, completion: nil)
    }
}

