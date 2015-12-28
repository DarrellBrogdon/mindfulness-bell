//
//  ViewController.swift
//  Mindfulness Bell
//
//  Created by Darrell Brogdon on 12/26/15.
//  Copyright © 2015 Darrell Brogdon. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let BellTypeSmall = 0
    let BellTypeLarge = 1
    
    @IBOutlet var intervalTextField: UITextField!
    @IBOutlet var intervalTypeSegmentedControl: UISegmentedControl!
    @IBOutlet var bellTypeSegmentedControl: UISegmentedControl!
    @IBOutlet var startStopButton: UIButton!
    
    var theIntervalType = 1
    var theBellType = 0
    
    var audioPlayer: AVAudioPlayer!
    var smallBellSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("small", ofType: "wav")!)
    var largeBellSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("large", ofType: "wav")!)
    
    @IBAction func setIntervalType(sender: UISegmentedControl) {
        theIntervalType = sender.selectedSegmentIndex
        print("Setting interval type to: \(theIntervalType)");
    }
    
    @IBAction func setBellType(sender: UISegmentedControl) {
        theBellType = sender.selectedSegmentIndex
        print("Setting the bell type to: \(theBellType)")
    }
    
    @IBAction func toggleBell(sender: UIButton) {
//        if startStopButton.titleLabel!.text == "Start" {
//            startStopButton.setTitle("Stop", forState: .Selected)
//        } else {
//            startStopButton.setTitle("Start", forState: .Selected)
        
            do {
                switch theBellType {
                case 1:
                    self.audioPlayer = try AVAudioPlayer(contentsOfURL: smallBellSound)
                default:
                    self.audioPlayer = try AVAudioPlayer(contentsOfURL: largeBellSound)
                }
                
                self.playBell()
            } catch {
                print("Error getting the audio file")
            }
//        }
    }
    
    func playBell() {
        self.audioPlayer.play()
        print("Playing the bell")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        intervalTypeSegmentedControl.selectedSegmentIndex = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

