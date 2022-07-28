//
//  PickerColorController.swift
//  Message
//
//  Created by kenjimaeda on 26/07/22.
//

import UIKit

protocol PickerColorDelegate {
	func applyColor(_ color: UIColor)
}

class PickerColorController: UIViewController {
	
	@IBOutlet weak var vPickerColor: UIView!
	@IBOutlet weak var sBlueColor: UISlider!
	@IBOutlet weak var sGreenColor: UISlider!
	@IBOutlet weak var sRedColor: UISlider!
	
	var pickerColorDelegate: PickerColorDelegate?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	
	@IBAction func chosseColor(_ sender: Any) {
		if let color = vPickerColor.backgroundColor {
			pickerColorDelegate?.applyColor(color)
		}
		dismiss(animated: true,completion: nil)
	}
	
	@IBAction func handlePickColor(_ sender: UISlider) {
		vPickerColor.backgroundColor = UIColor(red: CGFloat(  sRedColor.value), green: CGFloat(sGreenColor.value), blue: CGFloat(sBlueColor.value), alpha: 1)
	}
	
}
