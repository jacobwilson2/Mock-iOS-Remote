//
//  ThirdViewController.swift
//  Mock TV Remote
//
//  Created by Jacob Wilson on 3/5/20.
//  Copyright © 2020 Jacob Wilson. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var favoriteSegment: UISegmentedControl!
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var channelNum: UILabel!
    
    var favArray = ["ABC", "NBC", "CBS", "FOX"]
    var favIndex = 0
    
    @IBAction func textEntered(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func channelStepper(_ sender: UIStepper) {
        let channel = Int(sender.value)
        if (channel >= 1 && channel <= 99) {
            channelNum.text = Int(sender.value).description
        }
    }
    
    @IBAction func saveChannel(_ sender: UIButton) {
        if (userText.text!.count >= 1 && userText.text!.count <= 4) {
            let favIndex = favoriteSegment.selectedSegmentIndex
            favArray[favIndex] = userText.text!
            favoriteSegment.setTitle("\(userText.text!) : \(channelNum.text!)" , forSegmentAt: favIndex)
        } else {
            let title = "Alert"
            let message = "The label must be between 1 and 4 letters in length"
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelChannel(_ sender: UIButton) {
        userText.text = ""
        channelNum.text = "1"
        userText.resignFirstResponder()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
