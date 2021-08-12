//
//  SQLiteDatabase.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 09.08.2021.
//

import Foundation
import SQLite

class SQLiteDatabase {
    static let sharedInstance = SQLiteDatabase()
    var dataBase: Connection?
    
    private init() {
        
        //Создаю соединение с базой данных
        do {
            let documnetDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            
            let fileUrl = documnetDirectory.appendingPathComponent("taskList")
                .appendingPathExtension("sqlite3")
            print(fileUrl)
            
            dataBase = try Connection(fileUrl.path)
        } catch {
            print("Creating connection to database error: \(error)")
        }
    }
    //Создаю таблицу
    func createTable() {
        SQLiteCommands.createTable()
    }
}
