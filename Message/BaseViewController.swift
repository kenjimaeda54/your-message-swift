//
//  BaseViewController.swift
//  Message
//
//  Created by kenjimaeda on 25/07/22.
//

import UIKit


class BaseViewController: UIViewController {
	
	@IBOutlet weak var lbColor: UILabel!
	
	var message: Message!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	
	@IBAction func changeColor(_ sender:UIButton) {
		//vou instanciar uma viewController
		//assim posso aprensetar como modal
		//variavel pickerColro esta referenciando um storyboard do tipo
		//PickerColorController,nele existe um delegate por isso
		//tramento de delegate
		if let reference = self as? PickerColorDelegate{
			let pickerColor = storyboard?.instantiateViewController(withIdentifier:"PickerColorController" ) as! PickerColorController
			//com overCurrentContext vai ficar em cima da screen qeu esta chamando
			//parecido com os modais comuns
			pickerColor.modalPresentationStyle = .overCurrentContext
			pickerColor.pickerColorDelegate  = reference
			present(pickerColor, animated: true, completion: nil)
			
		}
	}
	
	
}
