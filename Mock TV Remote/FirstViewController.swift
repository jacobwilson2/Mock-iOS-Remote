//
//  FirstViewController.swift
//  Mock TV Remote
//
//  Created by Jacob Wilson on 3/2/20.
//  Copyright © 2020 Jacob Wilson. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var powerSwitch: UISwitch!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var channelSegment: UISegmentedControl!
    
    @IBOutlet weak var powerStatus: UILabel!
    @IBOutlet weak var volumeLevel: UILabel!
    @IBOutlet weak var curChannel: UILabel!
    
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var chUp: UIButton!
    @IBOutlet weak var chDown: UIButton!
    
    var channelArray = [String]()
    var typing = false
    var favChannel = ["ABC", "NBC", "CBS", "FOX"]
    
    @IBAction func togglePower(_ sender: UISwitch) {
        powerStatus.text = (sender.isOn ? "On" : "Off")
        powerSwitch.setOn(sender.isOn, animated: true)
        if sender.isOn == true {
            powerStatus.text = "On"
            volumeSlider.isEnabled = true
            zero.isEnabled = true
            one.isEnabled = true
            two.isEnabled = true
            three.isEnabled = true
            four.isEnabled = true
            five.isEnabled = true
            six.isEnabled = true
            seven.isEnabled = true
            eight.isEnabled = true
            nine.isEnabled = true
            chUp.isEnabled = true
            chDown.isEnabled = true
            channelSegment.isEnabled = true
        } else {
            powerStatus.text = "Off"
            volumeSlider.isEnabled = false
            zero.isEnabled = false
            one.isEnabled = false
            two.isEnabled = false
            three.isEnabled = false
            four.isEnabled = false
            five.isEnabled = false
            six.isEnabled = false
            seven.isEnabled = false
            eight.isEnabled = false
            nine.isEnabled = false
            chUp.isEnabled = false
            chDown.isEnabled = false
            channelSegment.isEnabled = false
        }
    }
    
    @IBAction func changeVolume(_ sender: UISlider) {
        volumeSlider.maximumValue = 100
        volumeLevel.text = "\(Int(sender.value))"
        
    }
    
    @IBAction func numPressed(_ sender: UIButton) {
        let number: String = sender.currentTitle!
        
        if channelArray.count < 2 {
            channelArray.append(number)
        }
        if channelArray.count == 2 {
            let newNumber = channelArray[0] + channelArray[1]
            curChannel.text = newNumber
            channelArray.removeAll()
        }
        
    }
    
    
    @IBAction func upPressed(_ sender: Any) {
        let currentChannel = Int(curChannel.text!)!
        if currentChannel < 99 {
            let newChannel = currentChannel + 1
            if newChannel < 10 {
                curChannel.text = "0" + "\(newChannel)"
            } else {
                curChannel.text = "\(newChannel)"
            }
        }
        
    }
    
    @IBAction func downPressed(_ sender: UIButton) {
        let currentChannel = Int(curChannel.text!)!
        if currentChannel > 1 {
            let newChannel = currentChannel - 1
            if newChannel < 10 {
                curChannel.text = "0" + "\(newChannel)"
            } else {
                curChannel.text = "\(newChannel)"
            }
        }
    }
    
    @IBAction func favoriteChannel(_ sender: UISegmentedControl) {
        if let channel = sender.titleForSegment(at: sender.selectedSegmentIndex) {
            if channel == "ABC" {
                curChannel.text = "07"
            } else if channel == "NBC" {
                curChannel.text = "05"
            } else if channel == "CBS" {
                curChannel.text = "02"
            } else {
                curChannel.text = "32"
            }
        }
    }
    
    @IBAction func updateFavorites(_ sender: UIButton) {
        let vc = ThirdViewController()
        
        for i in 0...3 {
            if (favChannel[i] != vc.favArray[i]) {
                channelSegment.setTitle(channelArray[i], forSegmentAt: i)
                favChannel[i] = vc.favArray[i]
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

