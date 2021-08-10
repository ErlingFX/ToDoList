//
//  SQLiteCommands.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 10.08.2021.
//

import Foundation
import SQLite

class SQLiteCommands {
    
    static var table = Table("task")
    
    //Выражения
    static let id = Expression<Int>("id")
    static let nameEvent = Expression<String>("nameEvent")
    static let createdDateEvent = Expression<Date>("createdDateEvent")
    //    static let image = Expression<Data>("image")
    
    //Создаю таблицу
    static func createTable() {
        guard let database = SQLiteDatabase.sharedInstance.dataBase else {
            print("Datastore connction error")
            return
        }
        
        do {
            // ifNotExists: true - НЕ будет создавать таблицу, если она уже существует
            try database.run(table.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(nameEvent)
                table.column(createdDateEvent)
                //                table.column(image)
            })
        } catch {
            print("Table already exists: \(error)")
        }
    }
    //Вставляю строку
    static func insertRow(_ contactValues: Task) -> Bool? {
        guard let database = SQLiteDatabase.sharedInstance.dataBase else {
            print("Datastore connection error")
            return nil
        }
        
        do {
            // не хватает id и image
            try database.run(
                table.insert(
                    nameEvent <- contactValues.nameEvent,
                    createdDateEvent <- contactValues.createdDateEvent
                )
            )
            return true
        } catch let Result.error(message, code, statement) where code == SQLITE_CONSTRAINT {
            print("Insert row failed: \(message), in \(String(describing: statement))")
            return false
        } catch let error {
            print("Insert failed: \(error)")
            return false
        }
    }
    
    // Present Rows (Настоящие строки?)
    static func presentRows() -> [Task]? {
        guard let database = SQLiteDatabase.sharedInstance.dataBase  else {
            print("Datastore connection error")
            return nil
        }
        
        //Task Array
        var taskArray = [Task]()
        
        //Sorting data in descending order by ID (Сортировка данных в порядке убывания по ID)
        //        table = table.order(id.desc)
        
        do {
            for task in try database.prepare(table) {
                //                let idValue = task[id]
                let nameIventValue = task[nameEvent]
                let dataEventValue = task[createdDateEvent]
                //                let imageValue = task[image]
                
                //Create object ( Создаю объект)
                //                let taskObject = Task(id: idValue, nameEvent: nameIventValue, createdDateEvent: dataEventValue, image: imageValue)
                let taskObject = Task(nameEvent: nameIventValue, createdDateEvent: dataEventValue)
                
                
                //Add object to an array (Добавить объект в массив)
                taskArray.append(taskObject)
                
                //                print("id: \(task[id]), nameEvent: \(task[nameEvent]), dateEvent: \(task[createdDateEvent]), image: \(task[image])")
                print("nameEvent: \(task[nameEvent]), dateEvent: \(task[createdDateEvent])")
            }
        } catch {
            print("Present row error: \(error)")
        }
        return taskArray
    }
}
