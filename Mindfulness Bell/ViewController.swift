//
//  ViewController.swift
//  Mindfulness Bell
//
//  Created by Darrell Brogdon on 12/26/15.
//  Copyright © 2015 Darrell Brogdon. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    var pickerDataSource = ["1 Minute", "2 Minutes", "3 Minutes", "4 Minutes", "5 Minutes", "6 Minutes", "7 Minutes",
        "8 Minutes", "9 Minutes", "10 Minutes", "11 Minutes", "12 Minutes", "13 Minutes", "14 Minutes",
        "15 Minutes", "16 Minutes", "17 Minutes", "18 Minutes", "19 Minutes", "20 Minutes", "21 Minutes",
        "22 Minutes", "23 Minutes", "24 Minutes", "25 Minutes", "26 Minutes", "27 Minutes", "28 Minutes",
        "29 Minutes", "30 Minutes", "31 Minutes", "32 Minutes", "33 Minutes", "34 Minutes", "35 Minutes",
        "36 Minutes", "37 Minutes", "38 Minutes", "39 Minutes", "40 Minutes", "41 Minutes", "42 Minutes",
        "43 Minutes", "44 Minutes", "45 Minutes", "46 Minutes", "47 Minutes", "48 Minutes", "49 Minutes",
        "50 Minutes", "51 Minutes", "52 Minutes", "53 Minutes", "54 Minutes", "55 Minutes", "56 Minutes",
        "57 Minutes", "58 Minutes", "59 Minutes", "60 Minutes"]
    let BellTypeSmall = 0
    let BellTypeLarge = 1
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet var intervalTextField: UITextField!
    @IBOutlet var bellTypeSegmentedControl: UISegmentedControl!
    @IBOutlet var startStopButton: UIButton!
    
    var theIntervalType = 1
    var theBellType = 0
    
    var theTimer = NSTimer()
    var theInterval: Double = 60.0
    
    var audioPlayer: AVAudioPlayer!
    var smallBellSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("small", ofType: "wav")!)
    var largeBellSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("large", ofType: "wav")!)
    
    @IBAction func setBellType(sender: UISegmentedControl) {
        theBellType = sender.selectedSegmentIndex
    }
    
    @IBAction func toggleBell(sender: UIButton) {
        if startStopButton.currentTitle! == "Start" {
            startStopButton.setTitle("Stop", forState: .Normal)
            
            do {
                switch theBellType {
                case 1:
                    self.audioPlayer = try AVAudioPlayer(contentsOfURL: largeBellSound)
                default:
                    self.audioPlayer = try AVAudioPlayer(contentsOfURL: smallBellSound)
                }
                
                pickerView.userInteractionEnabled = false
                bellTypeSegmentedControl.enabled = false
                
                self.playBell()
                self.theTimer.invalidate()
                self.theTimer = NSTimer.scheduledTimerWithTimeInterval(theInterval, target: self, selector: "playBell", userInfo: nil, repeats: true)
            } catch {
                print("Error getting the audio file")
            }
        } else {
            startStopButton.setTitle("Start", forState: .Normal)
            
            pickerView.userInteractionEnabled = true
            bellTypeSegmentedControl.enabled = true
            
            self.audioPlayer.stop()
            self.theTimer.invalidate()
        }
    }
    
    func playBell() {
        self.audioPlayer.play()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
  
//        let testImage = UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("meditation_bell", ofType: "png")!)
//        bellTypeSegmentedControl.insertSegmentWithImage(testImage, atIndex: 0, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        theInterval = Double((row + 1) * 60)
    }

}

