//
//  ViewController.swift
//  Message
//
//  Created by kenjimaeda on 25/07/22.
//

import UIKit

class MessageViewController: BaseViewController {
	
	@IBOutlet weak var tfMessage: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tfMessage.delegate = self
		message = Message()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		//para teclado ganhar  o foco
		tfMessage.becomeFirstResponder()
		navigationController?.setNavigationBarHidden(false, animated: true)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "screenColorSegue" {
			let destion = segue.destination as! ScreenColorViewController
			//estou enviando a struct
			destion.message = message
		}
	}
	

	
	
}
// Xcode now supports //MARK:, //TODO: and //FIXME landmarks to annotate your code and lists them in the jump bar. (14768427)!

//TODO: - This new feature xcode TODO

//FIXME: - PLEASE FIXME

//MARK: - UITextFieldDelegate
extension MessageViewController:UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		if let field = textField.text {
			
			if	!field.isEmpty {
				lbColor.text! = field
				message.text = field
				tfMessage.resignFirstResponder()
			}else {
				return false
			}
			
		}
		return true
	}
	
}

//MARK: - PickerColorDelegate

extension MessageViewController: PickerColorDelegate {
	func applyColor(_ color: UIColor) {
		lbColor.textColor = color
		message.textColor = color
	}
}
