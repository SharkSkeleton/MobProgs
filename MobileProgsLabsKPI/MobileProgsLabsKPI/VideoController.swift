import Foundation
import UIKit
import AVKit

class VideoController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker: UIPickerView!
    
    let arr = ["video 1", "video 2", "video 3", "video 4", "video 5", "video 6"]
    var selectedRow = ""
    var nameOfVideo = ""
    
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
    
    @IBAction func playVideo(_ sender: UIButton) {
        if let path = Bundle.main.path(forResource: nameOfVideo, ofType: "mp4") {
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            present(videoPlayer, animated: true, completion: {
                video.play()
            })
        }
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
        case "video 1":
            switchVideoName(name: "video1")
        case "video 2":
            switchVideoName(name: "video2")
        case "video 3":
            switchVideoName(name: "video3")
        case "video 4":
            switchVideoName(name: "video4")
        case "video 5":
            switchVideoName(name: "video5")
        case "video 6":
            switchVideoName(name: "video6")
        default:
            Util.showAlert(alertTitle: "Error", alertMessage: "You choose unexisting son", controller: self)
        }
        print("now selected row is: \(self.selectedRow)")
    }
    
    func switchVideoName(name:String) {
        nameOfVideo = name
    }
}
