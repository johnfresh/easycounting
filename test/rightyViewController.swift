//
//  rightyViewcontrollerViewController.swift
//  test
//
//  Created by paris bread on 7/31/18.
//  Copyright © 2018 paris bread. All rights reserved.
//

import UIKit
import AVFoundation

class rightyViewController: UIViewController {


    func tryVibrate(){
        if vibrate == true{
            if self.traitCollection.forceTouchCapability == .available{
                if isFirstTaptic == true{
                   // print("iphone 6s is not the fully functional version")
                    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
                }else{
                    tapFeedBack.impactOccurred()
                   // print("3d touch is avaliable")
                }
            }else{
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
                print("3d is disable")
            }
            
        }
    }


    
    @IBAction func increase(_ sender: UIButton) {
        tryVibrate()
        countNumber += steper
        totalAmont.text = String(countNumber)
        //AudioServicesPlayAlertSound(1352)  // 1352 is vibrating whenever the phone is vibrate or not
    }

    @IBAction func decrease(_ sender: UIButton) {
        tryVibrate()
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
       // steper = 1
       // stepValue.text = String(steper)
        
    }
    
    
	@IBAction func showHistory(_ sender: UIButton) {
		masterView = 2
		performSegue(withIdentifier: "rightToHistory", sender: self)
	}

    
    
    @IBOutlet weak var totalAmont: UILabel!
    @IBOutlet var stepValue: UILabel!
    @IBOutlet weak var vibrateState: UIButton!
    
    @IBAction func vcontrol(_ sender: UIButton) {
        if vibrate == true{
            vibrate = false
            vibrateState.setTitle("Vibrate:OFF", for: .normal)
        }else{
            vibrate = true
            vibrateState.setTitle("Vibrate:On", for: .normal)
        }
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        totalAmont.text = String(countNumber)
        stepValue.text = String(steper)
        if vibrate == true{
            vibrateState.setTitle("Vibrate:ON", for: .normal)
            vibrate = true
        }else{
            vibrateState.setTitle("Vibrate:OFF", for: .normal)
            vibrate = false
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func changedirection(_ sender: UIButton) {
        performSegue(withIdentifier: "changeBack", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
