//
//  ScreenColorViewController.swift
//  Message
//
//  Created by kenjimaeda on 27/07/22.
//

import UIKit

class ScreenColorViewController: BaseViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		lbColor.text = message.text
		lbColor.textColor = message.textColor
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "colorBackgroundSegue" {
			let destion = segue.destination as! MessageColorViewController
			destion.message  = message
		}
	}
	
}

//MARK: - UINavigationController
extension UINavigationController {
	//retirar o title do button
	open override func viewWillLayoutSubviews() {
		navigationBar.topItem?.backButtonDisplayMode = .minimal
	}
	
}

//MARK: - PickerColorDelegate
extension ScreenColorViewController:PickerColorDelegate {
	func applyColor(_ color: UIColor) {
		lbColor.backgroundColor = color
		message.backgroundColor = color
	}
}
