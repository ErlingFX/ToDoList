//
//  EditPresenter.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 12.08.2021.
//

import Foundation

protocol EditViewProtocol {
    func transferData(task: Task?)
}

protocol EditViewPresenterProtocol {
    var task: Task { get set }
    func transferDataTest()
    func updateRowFromSQLiteDatabase(task: Task)
    func createNewTask(_ eventValues:Task)
    init(view: EditViewProtocol, task: Task)
}

class EditPresenter: EditViewPresenterProtocol {
    var task: Task
    var view: EditViewProtocol?
    var router: EditRouter?
    var dataSource: [Task] = []
    
    required init(view: EditViewProtocol, task: Task) {
        self.view = view
        self.task = task
    }
    
    func transferDataTest() {
        view?.transferData(task: task)
    }
    
    func updateRowFromSQLiteDatabase(task: Task) {
        //        SQLiteCommands.deleteRow(idTask: task.id ?? 0)
        //        dataSource = SQLiteCommands.presentRows() ?? []
        //        view?.reloadData()
        
        SQLiteCommands.updateRow(idTask: task.id ?? 0, newTask: task.nameEvent )
        dataSource = SQLiteCommands.presentRows() ?? []
    }
    func createNewTask(_ eventValues:Task) {
        guard SQLiteCommands.insertRow(eventValues) != nil else {
            print("error")
            return
        }
    }
}
