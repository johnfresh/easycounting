//
//  ViewController.swift
//  test
//
//  Created by paris bread on 7/18/18.
//  Copyright © 2018 paris bread. All rights reserved.
//

import UIKit
import AVFoundation
var Vibrate = true
var countNumber = 0
var steper = 1
var countNumberArray = [Int]()

class ViewController: UIViewController {

    var shortVibration:UIImpactFeedbackGenerator? = nil
    var feedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
    
    
    @IBAction func increase(_ sender: UIButton) {
        if Vibrate{
            AudioServicesPlaySystemSound(1352)
        }
        countNumber += steper
        totalAmont.text = String(countNumber)
        feedbackGenerator.impactOccurred()
        
        
        //AudioServicesPlayAlertSound(1352)  // 1352 is vibrating whenever the phone is vibrate or not
    }
    @IBAction func decrease(_ sender: UIButton) {
        if Vibrate{
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }
        countNumber -= steper
        totalAmont.text = String(countNumber)
    }

	@IBAction func subSteper(_ sender: UIButton) {
        steper -= 1
        stepValue.text = String(steper)
    }
    @IBAction func addSteper(_ sender: UIButton) {
        steper += 1
        stepValue.text = String(steper)
    }
    
    @IBAction func clear(_ sender: UIButton) {
		countNumberArray.insert(countNumber, at: 0)
        countNumber = 0
         totalAmont.text = String(countNumber)
        steper = 1
        stepValue.text = String(steper)
        
    }
    
    
	@IBAction func showHistory(_ sender: UIButton) {
		performSegue(withIdentifier: "showHistory", sender: self)
	}

    
    
    @IBOutlet weak var totalAmont: UILabel!
    @IBOutlet var stepValue: UILabel!
    
    @IBOutlet weak var vibrateState: UIButton!
    
    @IBAction func vcontrol(_ sender: UIButton) {
        if Vibrate == true{
            Vibrate = false
            vibrateState.setTitle("Vibrate:OFF", for: .normal)
        }else{
            Vibrate = true
            vibrateState.setTitle("Vibrate:On", for: .normal)
        }
    }
    
    
    
    @IBAction func changeDirection(_ sender: UIButton) {
        performSegue(withIdentifier: "directionChange", sender: self)
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalAmont.text = String(countNumber)
        stepValue.text = String(steper)
        if Vibrate == true{
            vibrateState.setTitle("Vibrate:ON", for: .normal)
        }else{
            vibrateState.setTitle("Vibrate:OFF", for: .normal)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

