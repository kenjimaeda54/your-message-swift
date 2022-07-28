//
//  MessageColorViewController.swift
//  Message
//
//  Created by kenjimaeda on 25/07/22.
//

import UIKit

class MessageColorViewController: BaseViewController {
	
	@IBOutlet weak var vBorderWhite: UIView!
	@IBOutlet weak var sViewGeral: UIStackView!
	@IBOutlet weak var haveBorder: UISwitch!
	override func viewDidLoad() {
		super.viewDidLoad()
		lbColor.text = message.text
		lbColor.backgroundColor = message.backgroundColor
		lbColor.textColor = message.textColor
	}
	
	@IBAction func handleBorderWhite(_ sender: UISwitch) {
		if !sender.isOn {
			vBorderWhite.backgroundColor = .clear
		}else {
			vBorderWhite.backgroundColor = .white
		}
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "resultControllerSegue" {
			let destination =  segue.destination as! ResultViewController
			destination.message = message
			destination.isOn = haveBorder.isOn
		}
	}
	
}


//MARK: - PickerColorDelegate
extension MessageColorViewController:PickerColorDelegate {
	func applyColor(_ color: UIColor) {
		sViewGeral.backgroundColor = color
		message.screenColor = color
	}
}
