//
//  SecondViewController.swift
//  Mock TV Remote
//
//  Created by Jacob Wilson on 3/2/20.
//  Copyright © 2020 Jacob Wilson. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var powerStatus: UILabel!
    @IBOutlet weak var stateStatus: UILabel!
    
    @IBOutlet weak var powerSwitch: UISwitch!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var fastForwardButton: UIButton!
    @IBOutlet weak var fastRewindButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    var isPlaying = false
    var prevState = ""
    
    @IBAction func togglePower(_ sender: UISwitch) {
        powerStatus.text = (sender.isOn ? "ON" : "OFF")
        powerSwitch.setOn(sender.isOn, animated: true)
        if sender.isOn == true {
            powerStatus.text = "On"
            stateStatus.text = "Stopped"
            playButton.setTitleColor(UIColor.systemBlue, for: .normal)
            stopButton.setTitleColor(UIColor.systemBlue, for: .normal)
            recordButton.setTitleColor(UIColor.systemBlue, for: .normal)
            pauseButton.setTitleColor(UIColor.gray, for: .normal)
            fastRewindButton.setTitleColor(UIColor.gray, for: .normal)
            fastForwardButton.setTitleColor(UIColor.gray, for: .normal)
            
        } else {
            powerStatus.text = "Off"
            playButton.setTitleColor(UIColor.gray, for: .normal)
            stopButton.setTitleColor(UIColor.gray, for: .normal)
            recordButton.setTitleColor(UIColor.gray, for: .normal)
            pauseButton.setTitleColor(UIColor.gray, for: .normal)
            fastRewindButton.setTitleColor(UIColor.gray, for: .normal)
            fastForwardButton.setTitleColor(UIColor.gray, for: .normal)
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let button = sender.currentTitle!
        if isPlaying == false {
            if (sender.currentTitle! == "Pause" || sender.currentTitle! == "Fast Forward" || sender.currentTitle! == "Fast Rewind") {
                       
                let title = "Disabled Button"
                let message = "The action you are trying to perform is currently disabled"
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
                let cancelAction = UIAlertAction(title: "Cancel", style: .default) {action in self.stateStatus.text = self.prevState}
                let confirmAction = UIAlertAction(title: "Confirm", style: .default) {action in sender.setTitleColor(UIColor.systemBlue, for: .normal); self.stateStatus.text = String(sender.currentTitle!)}
                alertController.addAction(cancelAction)
                alertController.addAction(confirmAction)
                present(alertController, animated: true, completion: nil)
                   }
               } else {
                   if sender.currentTitle! == "Record" {
                       let title = "Disabled Button"
                       let message = "The action you are trying to perform is currently disabled"
                       let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
                       let cancelAction = UIAlertAction(title: "Cancel", style: .default) {action in return}
                       let confirmAction = UIAlertAction(title: "Confirm", style: .default) {action in sender.setTitleColor(UIColor.systemBlue, for: .normal); self.buttonPressed(sender)}
                       alertController.addAction(cancelAction)
                       alertController.addAction(confirmAction)
                       present(alertController, animated: true, completion: nil)
                       
                   }
               }
               
               
               switch button {
               case "Play":
                   isPlaying = true
                   stateStatus.text = "Playing"
                   prevState = "Playing"
                   pauseButton.setTitleColor(UIColor.systemBlue, for: .normal)
                   fastForwardButton.setTitleColor(UIColor.systemBlue, for: .normal)
                   fastRewindButton.setTitleColor(UIColor.systemBlue, for: .normal)
                   recordButton.setTitleColor(UIColor.gray, for: .normal)
                   
                   //pauseButton.isEnabled = true
                   //fastForwardButton.isEnabled = true
                   //fastRewindButton.isEnabled = true
                   //recordButton.isEnabled = false
                   
               case "Stop":
                   isPlaying = false
                   stateStatus.text = "Stopped"
                   prevState = "Stopped"
                   playButton.setTitleColor(UIColor.systemBlue, for: .normal)
                   pauseButton.setTitleColor(UIColor.gray, for: .normal)
                   fastForwardButton.setTitleColor(UIColor.gray, for: .normal)
                   fastRewindButton.setTitleColor(UIColor.gray, for: .normal)
                   recordButton.setTitleColor(UIColor.red, for: .normal)

                   //playButton.isEnabled = true
                   //pauseButton.isEnabled = false
                   //fastForwardButton.isEnabled = false
                   //fastRewindButton.isEnabled = false
                   //recordButton.isEnabled = true
                   
               case "Pause":
                   isPlaying = true
                   stateStatus.text = "Paused"
                   pauseButton.setTitleColor(UIColor.gray, for: .normal)
                   fastForwardButton.setTitleColor(UIColor.gray, for: .normal)
                   fastRewindButton.setTitleColor(UIColor.gray, for: .normal)
                   recordButton.setTitleColor(UIColor.gray, for: .normal)

                   //pauseButton.isEnabled = false
                   //fastForwardButton.isEnabled = false
                   //fastRewindButton.isEnabled = false
                   //recordButton.isEnabled = false
                   
               case "Fast Forward":
                   isPlaying = true
                   stateStatus.text = "Fast Forwarding"
                   pauseButton.setTitleColor(UIColor.gray, for: .normal)
                   fastForwardButton.setTitleColor(UIColor.gray, for: .normal)
                   fastRewindButton.setTitleColor(UIColor.gray, for: .normal)
                   recordButton.setTitleColor(UIColor.gray, for: .normal)
                   
                   //pauseButton.isEnabled = false
                   //fastForwardButton.isEnabled = false
                   //fastRewindButton.isEnabled = false
                   //recordButton.isEnabled = false
                   
               case "Fast Rewind":
                   isPlaying = true
                   stateStatus.text = "Fast Rewinding"
                   pauseButton.setTitleColor(UIColor.gray, for: .normal)
                   fastForwardButton.setTitleColor(UIColor.gray, for: .normal)
                   fastRewindButton.setTitleColor(UIColor.gray, for: .normal)
                   recordButton.setTitleColor(UIColor.gray, for: .normal)
                   
                   //pauseButton.isEnabled = false
                   //fastForwardButton.isEnabled = false
                   //fastRewindButton.isEnabled = false
                   //recordButton.isEnabled = false
                   
               case "Record":
                   isPlaying = false
                   stateStatus.text = "Recording"
                   prevState = "Recording"
                   playButton.setTitleColor(UIColor.gray, for: .normal)
                   pauseButton.setTitleColor(UIColor.gray, for: .normal)
                   fastForwardButton.setTitleColor(UIColor.gray, for: .normal)
                   fastRewindButton.setTitleColor(UIColor.gray, for: .normal)
                   recordButton.setTitleColor(UIColor.gray, for: .normal)
                   
                   //playButton.isEnabled = false
                   //pauseButton.isEnabled = false
                   //fastForwardButton.isEnabled = false
                   //fastRewindButton.isEnabled = false
                   //recordButton.isEnabled = false
                   
               default:
                   stateStatus.text = "Stopped"
               }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pauseButton.setTitleColor(UIColor.gray, for: .normal)
        fastRewindButton.setTitleColor(UIColor.gray, for: .normal)
        fastForwardButton.setTitleColor(UIColor.gray, for: .normal)
        recordButton.setTitleColor(UIColor.red, for: .normal)
    }


}

