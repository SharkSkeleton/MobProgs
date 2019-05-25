import UIKit

class ControllerLab1: UIViewController{
    
    @IBOutlet weak var userText: UILabel!
    @IBOutlet weak var inputUserText: UITextField!
    @IBOutlet weak var sizeSlider: UISlider!
    
    @IBAction func showTask(_ sender: UIButton) {
        Util.showAlert(alertTitle: "Задание к работе 1", alertMessage: "Вікно містить групу опцій для вибору розміру шрифту, текстове поле та кнопки «ОК» і «Cancel». Вивести введений рядок обраним розміром", controller: self)
    }
    
    @IBAction func showInstruction(_ sender: UIButton) {
        Util.showAlert(alertTitle: "Инструкция к работе 1", alertMessage: "Шаг 1: Введите текст в поле для ввода\nШаг 2: Выставьте слайдер в желаемое положение\nШаг 3: Нажмите кнопку ОК\nШаг 4: Нажмите кнопку Cancel, чтобы очистить поля и начать заново\nПодсказка: Чтобы использовать клавиатуру телефона нажмите cmd+K", controller: self)
    }
    
    @IBAction func okButtonpush(_ sender: UIButton) {
        userText.text = inputUserText.text
        userText.font = userText.font.withSize(CGFloat(Int(sizeSlider.value)))
    }
    @IBAction func cancelButtonpush(_ sender: Any) {
        sizeSlider.value = 20
        inputUserText.text = ""
        userText.text = ""
    }
}
