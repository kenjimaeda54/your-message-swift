//
//  ResultViewController.swift
//  Message
//
//  Created by kenjimaeda on 25/07/22.
//

import UIKit

class ResultViewController: BaseViewController {
	
	@IBOutlet var vMain: UIView!
	@IBOutlet weak var vBorderWhite: UIView!
	@IBOutlet weak var vBackGroundMessage: UIView!
	@IBOutlet weak var lMessage: UILabel!
	
	var isOn = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		vBorderWhite.clipsToBounds = true
		vBackGroundMessage.clipsToBounds = true
		vBackGroundMessage.layer.cornerRadius = 10
		vBackGroundMessage.layer.cornerRadius = 10
		vBorderWhite.backgroundColor = isOn ? .white : .clear
		vMain.backgroundColor = message.screenColor
		vBackGroundMessage.backgroundColor = message.backgroundColor
		lMessage.textColor = message.textColor
		lMessage.text = message.text
	}
	
	
	//quando toca na tela
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		navigationController?.popToRootViewController(animated: true)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		navigationController?.setNavigationBarHidden(true, animated: true)
	}
	
}


