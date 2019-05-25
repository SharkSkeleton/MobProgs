import UIKit
import SQLite3

class ControllerLab3: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var db: OpaquePointer?
    var actionList = [MyDB]()
    var value: String = ""
    
    @IBOutlet weak var userText: UILabel!
    @IBOutlet weak var inputUserText: UITextField!
    @IBOutlet weak var sizeSlider: UISlider!
    
    @IBAction func showTask(_ sender: UIButton) {
        Util.showAlert(alertTitle: "Задание к работе 3", alertMessage: "Написати програму під платформу Андроїд/iOS, яка має інтерфейс, побудований згідно варіанту та здійснює запис результату взаємодії з інтерфейсом до сховища (файл або базу даних), а користувача інформує відповідним повідомленням щодо успішного запису.\nІнтерфейс, побудований згідно варіанту, необхідно доповнити кнопкою «Відкрити», натискання на яку відображає вміст даних, що зберігаються у сховищі, у іншій Діяльності. Якщо дані відсутні (сховище пусте) відобразити відповідне повідомлення.\nПримітка: завдання відповідає варіанту лабораторної роботи No1.", controller: self)
    }
    
    @IBAction func showInstruction(_ sender: UIButton) {
        Util.showAlert(alertTitle: "Инструкция к работе 3", alertMessage: "Шаг 1: Введите текст в поле для ввода\nШаг 2: Выставьте слайдер в желаемое положение\nШаг 3: Нажмите кнопку ОК\nШаг 4: Нажмите кнопку Cancel, чтобы очистить поля и начать заново\nПодсказка: Чтобы использовать клавиатуру телефона нажмите cmd+K", controller: self)

    }
    
    @IBAction func okButtonpush(_ sender: UIButton) {
        userText.text = inputUserText.text
        userText.font = userText.font.withSize(CGFloat(Int(sizeSlider.value)))
        //Here we have end value of slider
        value = String(sizeSlider.value)
        
        let text = inputUserText.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        value = String(sizeSlider.value)
        
        createDB()
        
        var stmt: OpaquePointer?
        
        let queryString = "INSERT INTO MyDB (text, value) VALUES (?,?)"
        
        if (text == nil || text != "") {
            Util.showAlert(alertTitle: "Action", alertMessage: "Action saved successfully", controller: self)
            
            if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("error preparing insert: \(errmsg)")
                return
            }
            
            if sqlite3_bind_text(stmt, 1, text, -1, nil) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding name: \(errmsg)")
                return
            }
            
            if sqlite3_bind_text(stmt, 2, value, -1, nil) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding name: \(errmsg)")
                return
            }
            
            if sqlite3_step(stmt) != SQLITE_DONE {
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure inserting hero: \(errmsg)")
                return
            }
        }
        else {
            Util.showAlert(alertTitle: "Action", alertMessage: "Action saved failed! Read instruction!", controller: self)
        }
        readValues()

    }
    
    @IBAction func cancelButtonpush(_ sender: Any) {
        sizeSlider.value = 20
        inputUserText.text = ""
        userText.text = ""
    }
    
    func createDB() {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("MyDB.sqlite")

        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }

        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS MyDB (id INTEGER PRIMARY KEY AUTOINCREMENT, text TEXT, value TEXT)", nil, nil, nil) != SQLITE_OK {
        let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("error creating table: \(errmsg)")
            }
        }

    func readValues(){

        //first empty the list of heroes
        actionList.removeAll()

        //this is our select query
        let queryString = "SELECT * FROM MyDB"

        //statement pointer
        var stmt:OpaquePointer?

        //preparing the query
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }

        //traversing through all the records
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let id = sqlite3_column_int(stmt, 0)
            let text = String(cString: sqlite3_column_text(stmt, 1))
            let value = String(cString:sqlite3_column_text(stmt, 2))

            //adding values to list
            actionList.append(MyDB(id: Int(id), text: String(text), value: String(value)))
        }

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //this method is giving the row count of table view which is
        //total number of heroes in the list
        return actionList.count
    }


    //this method is binding the hero name with the tableview cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        let myDB: MyDB
        myDB = actionList[indexPath.row]
        cell.textLabel?.text = myDB.text
        return cell
    }
    
    func didLoad() {
        
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("MyDB.sqlite")
        
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
        
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS MyDB (id INTEGER PRIMARY KEY AUTOINCREMENT, text TEXT, value TEXT)", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
        }
        
        readValues()
    }
    @IBAction func openButt(_ sender: UIButton) {
        let stringArray = actionList.map { $0.text! }.joined(separator: "\n")
        Util.showAlert(alertTitle: "DataBase", alertMessage: stringArray, controller: self)
    }
}
