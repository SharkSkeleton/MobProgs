import Foundation
import UIKit
import AVFoundation

class AudioController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker: UIPickerView!
    
    let arr = ["song 1", "song 2", "song 3", "song 4", "song 5", "song 6"]
    var selectedRow = ""
    var player:AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        picker.delegate = self
        picker.dataSource = self
    }
    
    @IBAction func showTask(_ sender: UIButton) {
        Util.showAlert(alertTitle: "Задание к работе 4", alertMessage: "Написати програму під платформу Андроїд/iOS, яка має інтерфейс для запуску аудіо- файлів та відео-файлів. Мінімально інтерфейс має три кнопки Програти, Зупинити, Призупинити для відтворення відео-файлу або аудіо-файлу, який зберігається на мобільному пристрою. Додатково можливо розширити функціональність наступним:\n-надати вибір завантаження будь-якого файлу з деякого списку на мобільному пристрою;\n- надати обрати тип файлу для відтворення (аудіо або відео);\n- надати вибір завантаження файлу з Інтернет;\n- використовувати для реалізації обробки медіа-даних спеціалізованих інструментів.\nПримітка: конкретного варіанту лабораторної роботи непередбачено, студент сам формує функціональність програми.", controller: self)
    }
    
    @IBAction func showInstruction(_ sender: UIButton) {
        Util.showAlert(alertTitle: "Инструкция к работе 1", alertMessage: "Шаг 1: Введите текст в поле для ввода\nШаг 2: Выставьте слайдер в желаемое положение\nШаг 3: Нажмите кнопку ОК\nШаг 4: Нажмите кнопку Cancel, чтобы очистить поля и начать заново\nПодсказка: Чтобы использовать клавиатуру телефона нажмите cmd+K", controller: self)
    }
    
    @IBAction func playAudio(_ sender: UIButton) {
        player.play()
    }
    
    @IBAction func pausePush(_ sender: UIButton) {
        player.pause()
    }
    
    @IBAction func stopPush(_ sender: UIButton) {
        player.currentTime = 0
        player.pause()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.arr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.arr[row]
    }
    
    //function if selected current row
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedRow = self.arr[row]
        
        switch self.selectedRow {
        case "song 1":
            chooseSong(nameOfSong: "skillet1")
        case "song 2":
            chooseSong(nameOfSong: "skillet2")
        case "song 3":
            chooseSong(nameOfSong: "skillet3")
        case "song 4":
            chooseSong(nameOfSong: "skillet4")
        case "song 5":
            chooseSong(nameOfSong: "skillet5")
        case "song 6":
            chooseSong(nameOfSong: "skillet6")
        default:
            Util.showAlert(alertTitle: "Error", alertMessage: "You choose unexisting son", controller: self)
        }
        print("now selected row is: \(self.selectedRow)")
    }
    
    func chooseSong(nameOfSong:String) {
        do {
            let audioPath = Bundle.main.path(forResource: nameOfSong, ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch {
            //Error
        }
    }
}
