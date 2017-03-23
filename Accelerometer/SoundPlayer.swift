//
//  SoundPlayer.swift
//  Accelerometer
//
//  Created by Brian on 3/21/17.
//  Copyright © 2017 NHTI. All rights reserved.
//

import AVFoundation
import MediaPlayer
class SoundPlayer {
    
    class var sharedInstance : SoundPlayer {
        struct Static {
            static let instance : SoundPlayer = SoundPlayer()
        }
        return Static.instance
    }
    
    var error:NSError?
    var player = AVAudioPlayer()
    let soundURL = Bundle.main.url(forResource: "Scream", withExtension: "mp3")!
//    let soundURL = Bundle.main.url(forResource: "RickRoll", withExtension: "m4a")!

    
    init() {
        do {
//            (MPVolumeView().subviews.filter{NSStringFromClass($0.classForCoder) == "MPVolumeSlider"}.first as? UISlider)?.setvalue(1, animated: false)
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
//            try AVAudioSession.sharedInstance().overrideOutputAudioPort(AVAudioSessionPortOverride.speaker)
            player = try AVAudioPlayer(contentsOf: soundURL)

        } catch let error as NSError {
            print(error.description)
        }

    }
    
    func playSound() {

//        player.volume = 1.0
        player.play()
    }
}
