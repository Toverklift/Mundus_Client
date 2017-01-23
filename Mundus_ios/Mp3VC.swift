//
//  Mp3VC.swift
//  Mundus_ios
//
//  Created by Stephan on 11/01/2017.
//  Copyright (c) 2017 Stephan. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

class Mp3VC: UIViewController, AVAudioPlayerDelegate{
    var player: AVAudioPlayer?
    var index : Int = 0

    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var textview: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        playSound()
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.done()
    }

    func done() {
        performSegue(withIdentifier: "playerTabs", sender: nil)
        if player != nil {
            player!.stop()
        }
    }

    func playSound() {
        if let audio = NSDataAsset(name: "Mundus_introduction") {
            do {
                player = try AVAudioPlayer(data: audio.data, fileTypeHint: AVFileTypeMPEGLayer3)
                player!.delegate = self
                guard let player = player else { return }

                player.prepareToPlay()
                player.play()
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }

    @IBAction func skipClicked(_ sender: Any) {
        self.done()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
