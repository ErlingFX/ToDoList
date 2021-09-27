//
//  SQLiteCommands.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 10.08.2021.
//

import Foundation
import SQLite

class SQLiteCommands {
    
    static var table = Table("tasks")
    
    //Поля
    static let id = Expression<Int64>("id")
    static var nameEvent = Expression<String>("nameEvent")
    static let createdDateEvent = Expression<Date>("createdDateEvent")
    static let image = Expression<String?>("image")
    
    //MARK: - Создаю таблицу
    static func createTable() {
        guard let database = SQLiteDatabase.sharedInstance.dataBase else {
            print("Datastore connction error")
            return
        }
        do {
            // ifNotExists: true - НЕ будет создавать таблицу, если она уже существует
            try database.run(table.create(ifNotExists: true) { table in
                table.column(id, primaryKey: .autoincrement)
                table.column(nameEvent)
                table.column(createdDateEvent)
                table.column(image)
            })
        } catch {
            print("Table already exists: \(error)")
        }
    }
    //MARK: - Вставляю строку
    static func insertRow(_ eventValues: Task) -> Bool? {
        guard let database = SQLiteDatabase.sharedInstance.dataBase else {
            print("Datastore connection error")
            return nil
        }
        do {
            // не хватает image
            let rowId = try database.run(
                table.insert(
                    nameEvent <- eventValues.nameEvent,
                    createdDateEvent <- eventValues.createdDateEvent,
                    image <- eventValues.image
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
    //MARK: - Present Rows (запрос всех данных)
    static func presentRows() -> [Task]? {
        guard let database = SQLiteDatabase.sharedInstance.dataBase  else {
            print("Datastore connection error")
            return nil
        }
        //Task Array
        var taskArray = [Task]()
        
        //MARK: -Sorting data in descending order by ID (Сортировка данных в порядке убывания по ID)
        table = table.order(id.desc)
        do {
            for task in try database.prepare(table) {
                let idValue = task[id]
                let nameIventValue = task[nameEvent]
                let dataEventValue = task[createdDateEvent]
                let imageValue = task[image]
                
                //MARK: - Create object ( Создаю объект)
                let taskObject = Task(id: idValue, nameEvent: nameIventValue, createdDateEvent: dataEventValue, image: imageValue)
                
                //MARK: - Add object to an array - (Добавить объект в массив)
                taskArray.append(taskObject)
                // image: \(task[image])
                print("id: \(task[id]), nameEvent: \(task[nameEvent]), dateEvent: \(task[createdDateEvent]), image: \(String(describing: task[image])))")
            }
        } catch {
            print("Present row error: \(error)")
        }
        return taskArray
    }
    //MARK: - Удаляю ячейку
    static func deleteRow(idTask: Int64) -> Bool {
        do {
            try SQLiteDatabase.sharedInstance.dataBase?.execute("DELETE FROM tasks WHERE \"id\" = \(idTask)")
            return true
        } catch {
            print(error)
            print("Delete task failed")
        }
        return false
    }
    //MARK: - Изменяю ячейку
    static func updateRow(task: Task) {
        do {
            guard let idTask = task.id else { return }
            let stringId = String(describing: idTask)
            if let image = task.image {
                try SQLiteDatabase.sharedInstance.dataBase?.execute("UPDATE tasks SET nameEvent = '\(task.nameEvent)', image = '\(image)' WHERE id = \(stringId)")
            } else {
                print("не изменяет image")
                try SQLiteDatabase.sharedInstance.dataBase?.execute("UPDATE tasks SET nameEvent = '\(task.nameEvent)'  WHERE id = \(stringId)")
            }
            print("update NameEvent")
        } catch {
            print(error)
            print("Update task failed")
        }
    }
    
    //MARK: - получаю ячейку , один объект по id
    static func obtainTask(task: Task) -> Task? {
        guard let database = SQLiteDatabase.sharedInstance.dataBase  else {
            print("Datastore connection error")
            return nil
        }
        var taskArray = [Task]()
        let taskq = table.filter(id == task.id!)
        do {
            for task in try database.prepare(taskq) {
                let idValue = task[id]
                let nameIventValue = task[nameEvent]
                let dataEventValue = task[createdDateEvent]
                let imageValue = task[image]
                
                let taskObject = Task(id: idValue, nameEvent: nameIventValue, createdDateEvent: dataEventValue, image: imageValue)
                taskArray.append(taskObject)
                // image: \(task[image])
                print("id: \(task[id]), nameEvent: \(task[nameEvent]), dateEvent: \(task[createdDateEvent]), image: \(task[image])")
            }
        } catch {
            print("Present row error: \(error)")
        }
        return taskArray.first
    }
}
