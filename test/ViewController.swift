//
//  ViewController.swift
//  test
//
//  Created by paris bread on 7/18/18.
//  Copyright © 2018 paris bread. All rights reserved.
//

import UIKit
import AVFoundation

var vibrate = true

var countNumber = 0
var steper = 1
var countNumberArray = [Int]()
var isFirstTaptic : Bool?

//var _3dtouchEnabled : Bool?
let tapFeedBack = UIImpactFeedbackGenerator(style: .heavy)

extension UIDevice {
	//获取设备具体详细的型号
	var modelName: String {
		var systemInfo = utsname()
		uname(&systemInfo)
		let machineMirror = Mirror(reflecting: systemInfo.machine)
		let identifier = machineMirror.children.reduce("") { identifier, element in
			guard let value = element.value as? Int8, value != 0 else { return identifier }
			return identifier + String(UnicodeScalar(UInt8(value)))
		}
		switch identifier {
		case "iPhone8,1":                                 return "True"
		case "iPhone8,2":                                 return "True"
		default:                                        return identifier

		}
	}

}


	



class ViewController: UIViewController {

	func isFirstGenerationTaptic()->Bool{
		let identifer = UIDevice.current.modelName
		if identifer == "True"{
			return true
		}else{
			return false
		}
	}


	func tryVibrate(){
		if vibrate == true{

			if self.traitCollection.forceTouchCapability == .available{
				if isFirstTaptic == true{
					print("iphone 6s is not the fully functional version")
					AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)

				}else{
					tapFeedBack.impactOccurred()
					print("3d touch is avaliable")
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



	//lines for debug stop

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
        //steper = 1
        //stepValue.text = String(steper)
        
    }
    
    
	@IBAction func showHistory(_ sender: UIButton) {
		masterView = 1
		performSegue(withIdentifier: "showHistory", sender: self)
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
    
    
    
    @IBAction func changeDirection(_ sender: UIButton) {
        performSegue(withIdentifier: "directionChange", sender: self)
        
    }
    
	func vibrateOn(){
		vibrateState.setTitle("Vibrate:ON", for: .normal)
	}
	func vibrateOff(){
		vibrateState.setTitle("Vibrate:OFF", for: .normal)
	}
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
		/*if self.traitCollection.forceTouchCapability == .available {
			_3dtouchEnabled = true
		}else{
			_3dtouchEnabled = false
		}*/
		if isFirstGenerationTaptic(){
			isFirstTaptic = true
		}


        totalAmont.text = String(countNumber)
        stepValue.text = String(steper)
        if vibrate == true{
            vibrateOn()
        }else{
            vibrateOff()
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

