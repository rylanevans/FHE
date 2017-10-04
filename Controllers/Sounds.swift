//
//  Sounds.swift
//  FHE
//
//  Created by Rylan Evans on 10/3/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import AVFoundation



var clickSound: AVAudioPlayer!

func clickSoundURL() {
    let click = Bundle.main.path(forResource: "Click", ofType: "wav")
    let clickURL = URL(fileURLWithPath: click!)
    do {
        try clickSound = AVAudioPlayer(contentsOf: clickURL)
    } catch let err as NSError {
        print(err.debugDescription)
    }
}

func playClick() {
    if clickSound.isPlaying {
        clickSound.stop()
    }
    clickSound.play()
}

