import UIKit
import SQLite3

class ViewController: UIViewController {

    @IBAction func showInfo(_ sender: UIButton) {
        Util.showAlert(alertTitle: "Информация о авторе", alertMessage: "Приложение разработано студентом КПИ, факультета ФИВТ, группы ИС-62, Мягким Михаилом.\n Вариант: 10 % 18 + 1 = " + String(10%18+1), controller: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //delete all in db
//        var db: OpaquePointer?
//        var stmt: OpaquePointer?
//        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
//            .appendingPathComponent("MyDB.sqlite")
//
//        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
//            print("error opening database")
//        }
//
//        if sqlite3_exec(db, "DELETE FROM MyDB ", nil, nil, nil) != SQLITE_OK {
//            let errmsg = String(cString: sqlite3_errmsg(db)!)
//            print("error deleting table: \(errmsg)")
//        }
        }
}

