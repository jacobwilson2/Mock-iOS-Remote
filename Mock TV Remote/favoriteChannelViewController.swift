//
//  favoriteChannelViewController.swift
//  Mock TV Remote
//
//  Created by Jacob Wilson on 3/5/20.
//  Copyright © 2020 Jacob Wilson. All rights reserved.
//

import UIKit

class favoriteChannelViewController: UIViewController {

    @IBOutlet weak var favoriteSegment: UISegmentedControl!
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var channelNum: UILabel!
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        let channel = Int(sender.value)
        
        if channel >= 1 && channel <= 99 {
            channelNum.text = Int(sender.value).description
        }
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
