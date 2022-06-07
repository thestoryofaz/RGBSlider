import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet var colorView: UIView!
    
    //    Label Цветов
    @IBOutlet var redColorLabel: UILabel!
    @IBOutlet var greenColorLabel: UILabel!
    @IBOutlet var blueColorLabel: UILabel!
    
    //    Label данных в Float
    @IBOutlet var redColorValue: UILabel!
    @IBOutlet var greenColorValue: UILabel!
    @IBOutlet var blueColorValue: UILabel!
    
    //    Значение цвета в TextField
    @IBOutlet var redColortextField: UITextField!
    @IBOutlet var greenColorTextField: UITextField!
    @IBOutlet var blueColorTextField: UITextField!
    
    //    Слайдеры
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        Свайп вниз убирает клавиатуру
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.hideKeyboardOnSwipeDown))
        swipeDown.delegate = self  
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
        
        //        Кнопка Done у каждого TextField
        self.addDoneButton(textField: redColortextField)
        self.addDoneButton(textField: greenColorTextField)
        self.addDoneButton(textField: blueColorTextField)
        
        colorView.layer.cornerRadius = 20
        
        //        Название цветов
        redColorLabel.text = "Red:"
        greenColorLabel.text = "Green:"
        blueColorLabel.text = "Blue:"
        
        //        Цвет слайдера
        redColorSlider.minimumTrackTintColor = .red
        greenColorSlider.minimumTrackTintColor = .green
        blueColorSlider.minimumTrackTintColor = .blue
        
        //        Минимальное значение слайдеров
        redColorSlider.minimumValue = 0
        greenColorSlider.minimumValue = 0
        blueColorSlider.minimumValue = 0
        
        //        Максимальное значение слайдеров
        redColorSlider.maximumValue = 1
        greenColorSlider.maximumValue = 1
        blueColorSlider.maximumValue = 1
        
        //        Значение слайдеров при загрузке
        redColorSlider.value = 0
        greenColorSlider.value = 0
        blueColorSlider.value = 0
        
        //        Значение Text Label и Text Field
        redColorValue.text = String(NSString(format: "%.2f", redColorSlider.value))
        greenColorValue.text = String(NSString(format: "%.2f", greenColorSlider.value))
        blueColorValue.text = String(NSString(format: "%.2f", blueColorSlider.value))
        
        redColortextField.text = String(NSString(format: "%.2f", redColorSlider.value))
        greenColorTextField.text = String(NSString(format: "%.2f", greenColorSlider.value))
        blueColorTextField.text = String(NSString(format: "%.2f", blueColorSlider.value))
        
        colorView.backgroundColor = UIColor.init(red: CGFloat(redColorSlider.value), green: CGFloat(greenColorSlider.value), blue: CGFloat(blueColorSlider.value), alpha: 1)
        
    }
    
    //    MARK: Изменение цвета с помощью UISlider
    
    @IBAction func redColorSliderChange() {
        colorView.backgroundColor = UIColor.init(red: CGFloat(redColorSlider.value), green: CGFloat(greenColorSlider.value), blue: CGFloat(blueColorSlider.value), alpha: 1)
        redColorValue.text = String(NSString(format: "%.2f", redColorSlider.value))
        redColortextField.text = String(NSString(format: "%.2f", redColorSlider.value))
    }
    
    @IBAction func greenColorSliderChange() {
        colorView.backgroundColor = UIColor.init(red: CGFloat(redColorSlider.value), green: CGFloat(greenColorSlider.value), blue: CGFloat(blueColorSlider.value), alpha: 1 )
        greenColorValue.text = String(NSString(format: "%.2f", greenColorSlider.value))
        greenColorTextField.text = String(NSString(format: "%.2f", greenColorSlider.value))
    }
    
    @IBAction func blueColorSliderChange() {
        colorView.backgroundColor = UIColor.init(red: CGFloat(redColorSlider.value), green: CGFloat(greenColorSlider.value), blue: CGFloat(blueColorSlider.value), alpha: 1)
        blueColorValue.text = String(NSString(format: "%.2f", blueColorSlider.value))
        blueColorTextField.text = String(NSString(format: "%.2f", blueColorSlider.value))
    }
    
    //    MARK: Изменение UISlider введя данные в Text Field
    
    @IBAction func redTextFieldToSlider() {
        guard let inputText = redColortextField.text, !inputText.isEmpty else { return }
        
        if Float(inputText)! > 1.1 {
            alert(title: "Ошибка", message: "Введите число от 0.0 до 1.0")
        } else {
            redColorSlider.value = Float(inputText)!
            redColorSliderChange()
        }
        
    }
    
    @IBAction func greenTextFieldToSlider() {
        guard let inputText = greenColorTextField.text, !inputText.isEmpty else { return }
        
        if Float(inputText)! > 1.1 {
            alert(title: "Ошибка", message: "Введите число от 0.0 до 1.0")
        } else {
            greenColorSlider.value = Float(inputText)!
            greenColorSliderChange()
        }
    }
    
    @IBAction func blueTextFieldToSlider() {
        guard let inputText = blueColorTextField.text, !inputText.isEmpty else { return }
        
        
        if Float(inputText)! > 1.1 {
            alert(title: "Ошибка", message: "Введите число от 0.0 до 1.0")
        } else {
            blueColorSlider.value = Float(inputText)!
            blueColorSliderChange()
        }
    }
    
    //    MARK: Добавление кнопки Done над клавиатурой
    
    func addDoneButton(textField: UITextField) {
        
        let keyboardToolBar: UIToolbar = UIToolbar()
        keyboardToolBar.items = [UIBarButtonItem(title: "Done",
                                                 style: UIBarButtonItem.Style.done,
                                                 target: textField,
                                                 action: #selector(UITextField.resignFirstResponder)),
                                 
                                 UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace ,
                                                 target: self,
                                                 action: nil)]
        
        keyboardToolBar.sizeToFit()
        textField.inputAccessoryView = keyboardToolBar
        
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    @objc func hideKeyboardOnSwipeDown() {
        view.endEditing(true)
    }
    
}

// MARK: Alert
extension ViewController {
    
    func alert(title: String, message: String) {
        
        let alert =  UIAlertController(title: title,
                                       message: message,
                                       preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.redColortextField.text = String(self.redColorSlider.value)
            self.greenColorTextField.text  = String(self.greenColorSlider.value)
            self.blueColorTextField.text  = String(self.blueColorSlider.value)
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
