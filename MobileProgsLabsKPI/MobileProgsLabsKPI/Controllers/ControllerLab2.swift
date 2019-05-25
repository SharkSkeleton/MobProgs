import UIKit

class ControllerLab2: UIViewController{
    @IBOutlet weak var userText: UILabel!
    @IBOutlet weak var inputUserText: UITextField!
    @IBOutlet weak var sizeSlider: UISlider!
    
    @IBAction func showTask(_ sender: UIButton) {
        Util.showAlert(alertTitle: "Задание к работе 2", alertMessage: "Написати програму під платформу Андроїд, яка має інтерфейс, побудований з одного або декількох Фрагментів згідно варіанту та відображає результат взаємодії з цим інтерфейсом як інший Фрагмент, що додається до вікна цього ж інтерфейсу. \nПримітка: завдання відповідає варіанту лабораторної роботи No1.", controller: self)
    }
    
    @IBAction func showInstruction(_ sender: UIButton) {
        Util.showAlert(alertTitle: "Инструкция к работе 2", alertMessage: "Шаг 1: Введите текст в поле для ввода\nШаг 2: Выставьте слайдер в желаемое положение\nШаг 3: Нажмите кнопку ОК\nШаг 4: Нажмите кнопку Cancel, чтобы очистить поля и начать заново\nПодсказка: Чтобы использовать клавиатуру телефона нажмите cmd+K", controller: self)
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
