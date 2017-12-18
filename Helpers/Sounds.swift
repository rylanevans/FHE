//
//  Sounds.swift
//  FHE
//
//  Created by Rylan Evans on 10/3/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

extension UIViewController {
    
    static var clickSound: AVAudioPlayer!
    
    func clickSoundURL() {
        let click = Bundle.main.path(forResource: "Click", ofType: "wav")
        let clickURL = URL(fileURLWithPath: click!)
        do {
            try UIViewController.clickSound = AVAudioPlayer(contentsOf: clickURL)
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func playClick() {
        if UIViewController.clickSound.isPlaying {
            UIViewController.clickSound.stop()
        }
        UIViewController.clickSound.play()
    }
    
    static var offSound: AVAudioPlayer!
    
    func offSoundURL() {
        let off = Bundle.main.path(forResource: "No Sound", ofType: "m4a")
        let offURL = URL(fileURLWithPath: off!)
        do {
            try UIPageViewController.offSound = AVAudioPlayer(contentsOf: offURL)
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func turnOffAudio() {
        if UIPageViewController.offSound.isPlaying {
            UIPageViewController.offSound.stop()
        }
        UIPageViewController.offSound.play()
    }
}

extension UIPageViewController {
    
    static var clickSoundPVC: AVAudioPlayer!
    
    func clickSoundURLPVC() {
        let click = Bundle.main.path(forResource: "Click", ofType: "wav")
        let clickURL = URL(fileURLWithPath: click!)
        do {
            try UIPageViewController.clickSound = AVAudioPlayer(contentsOf: clickURL)
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func playClickPVC() {
        if UIPageViewController.clickSound.isPlaying {
            UIPageViewController.clickSound.stop()
        }
        UIPageViewController.clickSound.play()
    }
}
