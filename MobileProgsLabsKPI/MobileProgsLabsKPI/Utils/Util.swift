import Foundation
import UIKit
import SQLite3

class Util {
    public static func showAlert(alertTitle: String, alertMessage: String, controller: UIViewController) {
        // create the alert
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        controller.present(alert, animated: true, completion: nil)
    }
    
//    public static func dbCreate() {
//        var db: OpaquePointer?
//
//        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("MyDB.sqlite")
//
//        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
//            print("Error opening Database")
//            return
//        }
//
//        let createTableQuery = "CREATE TABLE IF NOT EXISTS Elements (id INTEGER PRIMARY KEY AUTOINCREMENT, action TEXT)"
//
//        if sqlite3_exec(db, createTableQuery, nil, nil, nil) != SQLITE_OK {
//            print("Error creating Database")
//            return
//        }
//
//        print("Everything is fine!")
//    }
//
//    public static func dbInsert(inputUserText: String, sizeSlider: CGFloat) {
//        var db: OpaquePointer?
//        let action = inputUserText
//
//        if(inputUserText.isEmpty) {
//            print("You don`t put any text")
//            return
//        }
//        var stmt: OpaquePointer?
//
//        let insertQuery = "INSERT INTO MyDB (action) VALUES (?)"
//
//        if sqlite3_prepare(db, insertQuery, -1, &stmt, nil) != SQLITE_OK {
//            print("Error binding query")
//            return
//        }
//
//        if sqlite3_bind_text(stmt, 1, inputUserText, -1, nil) != SQLITE_OK {
//            print("Error binding query")
//            return
//        }
//
//        if sqlite3_step(stmt) == SQLITE_DONE {
//            print("Action Added")
//        }
//    }
//
//    public static func createDataBase() {
//        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
//    .appendingPathComponent("MyDB.sqlite")
//    }
    
//    public static func createDB() {
//        var db: OpaquePointer?
//
//        //the database file
//        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
//            .appendingPathComponent("HeroesDatabase.sqlite")
//
//        //opening the database
//        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
//            print("error opening database")
//        }
//
//        //creating table
//        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS Heroes (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, powerrank INTEGER)", nil, nil, nil) != SQLITE_OK {
//            let errmsg = String(cString: sqlite3_errmsg(db)!)
//            print("error creating table: \(errmsg)")
//        }
//    }
    
//    public static func insertDB(db: OpaquePointer?) {
//        //getting values from textfields
//        let name = textFieldName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
//        let powerRanking = textFieldPowerRanking.text?.trimmingCharacters(in: .whitespacesAndNewlines)
//
//
//        //validating that values are not empty
//        if(name?.isEmpty)!{
//            textFieldName.layer.borderColor = UIColor.red.cgColor
//            return
//        }
//
//        if(powerRanking?.isEmpty)!{
//            textFieldName.layer.borderColor = UIColor.red.cgColor
//            return
//        }
//
//        //creating a statement
//        var stmt: OpaquePointer?
//
//        //the insert query
//        let queryString = "INSERT INTO Heroes (name, powerrank) VALUES (?,?)"
//
//        //preparing the query
//        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
//            let errmsg = String(cString: sqlite3_errmsg(db)!)
//            print("error preparing insert: \(errmsg)")
//            return
//        }
//
//        //binding the parameters
//        if sqlite3_bind_text(stmt, 1, name, -1, nil) != SQLITE_OK{
//            let errmsg = String(cString: sqlite3_errmsg(db)!)
//            print("failure binding name: \(errmsg)")
//            return
//        }
//
//        if sqlite3_bind_int(stmt, 2, (powerRanking! as NSString).intValue) != SQLITE_OK{
//            let errmsg = String(cString: sqlite3_errmsg(db)!)
//            print("failure binding name: \(errmsg)")
//            return
//        }
//
//        //executing the query to insert values
//        if sqlite3_step(stmt) != SQLITE_DONE {
//            let errmsg = String(cString: sqlite3_errmsg(db)!)
//            print("failure inserting hero: \(errmsg)")
//            return
//        }
//
//        //emptying the textfields
//        textFieldName.text=""
//        textFieldPowerRanking.text=""
//
//
//        readValues()
//
//        //displaying a success message
//        print("Herro saved successfully")
//    }
    
//    public static func readValues(db: OpaquePointer?) {
//        var actionList = [MyDB]()
//        //first empty the list of heroes
//        actionList.removeAll()
//
//        //this is our select query
//        let queryString = "SELECT * FROM MyDB"
//
//        //statement pointer
//        var stmt:OpaquePointer?
//
//        //preparing the query
//        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
//            let errmsg = String(cString: sqlite3_errmsg(db)!)
//            print("error preparing insert: \(errmsg)")
//            return
//        }
//
//        //traversing through all the records
//        while(sqlite3_step(stmt) == SQLITE_ROW){
//            let id = sqlite3_column_int(stmt, 0)
//            let text = String(cString: sqlite3_column_text(stmt, 1))
//            let value = String(cString: sqlite3_column_text(stmt, 2))
//
//            //adding values to list
//            actionList.append(MyDB(id: Int(id), text: String(describing: text), value: String(describing: value)))
//        }
//    }
    
}
