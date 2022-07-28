# Your Message
App para customizar sua mensagem com cor de moldura,cor no texto e fundo


## Feature
  - Entendi como aplicar modais tradicionais em IOS
- Para funcionar corretamente quando estamos com delegate em uma classe no estilo modal, precisamos referenciar com self
- Motivo e para o delegate entender  que a classe modal chamou o protocolo e não quem implementa o modal
- ModalPresentationStyle existem várias possibilidades, para modal tradicional e .overCurrentContext
- Foi necessário força o casting para entender o delegate
- Este alogaritmo fica na classe que vai implementar o modal

```swift
if let reference = self as? PickerColorDelegate{
   let pickerColor = storyboard?.instantiateViewController(withIdentifier:"PickerColorController" ) as! PickerColorController
   pickerColor.modalPresentationStyle = .overCurrentContext 
   pickerColor.pickerColorDelegate  = reference
   present(pickerColor, animated: true, completion: nil)
			
}
```
##
- Eu criei uma struct e compartilhei com toda aplicação, isto lembra muito estados globais
- Para isto funcionar precisa uma classe base e compartilhar a struct via rota, 
- Classe base ela servira como super classe para outras que irão herdar seus métodos 
- Você não pode instanciar a struct na classe base, apenas iniciar com uma referência, quem instancia e a classe root caso seja navegação


```swift
//classe base
class BaseViewController: UIViewController {
	
  @IBOutlet weak var lbColor: UILabel!
	
  var message: Message!
	
   override func viewDidLoad() {
     super.viewDidLoad()
		
   }
	
	
   @IBAction func changeColor(_ sender:UIButton) {
	if let reference = self as? PickerColorDelegate{
	let pickerColor = storyboard?.instantiateViewController(withIdentifier:"PickerColorController" ) as! PickerColorController
	pickerColor.modalPresentationStyle = .overCurrentContext
	pickerColor.pickerColorDelegate  = reference
	present(pickerColor, animated: true, completion: nil)
			
	}
   }
	
	
}

//outras classes
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
	    destion.message = message
	  }
	}
		
	
}

```

##
- Aprendi algumas features interessantes:
- Como fechar o teclado ou deixar no foco com becomeFirstResponder() ou  resingFirstResponse
- Para o IOS todo campo de input ou botoes e considerado FirstResponder
- Aprendi melhor o uso do ciclo de vida do IOS
- viewDidLoad e só chamado quando a screen foi destruída,
- Caso  screen exista  na memória não sera  executado viewDidLoad, normalmente as telas roots não  são destruídos
- Por isso e interessante o uso do ciclo de vida como viewWillAppear
 

```swift

 //este ciclo e assim que a tela ira ser criada
 override func viewWillAppear(_ animated: Bool) {
      //para teclado ganhar  o foco
      tfMessage.becomeFirstResponder()
     navigationController?.setNavigationBarHidden(false, animated: true)
 }
  
 // para apagar o titulo do buttom navigation
 extension UINavigationController {
    open override func viewWillLayoutSubviews() {
	navigationBar.topItem?.backButtonDisplayMode = .minimal
   }
 }
 
 
 / Xcode now supports //MARK:, //TODO: and //FIXME landmarks to annotate your code and lists them in the jump bar. (14768427)!

 //TODO: - This new feature xcode TODO

 //FIXME: - PLEASE FIXME

 //MARK: - UITextFieldDelegate

```




