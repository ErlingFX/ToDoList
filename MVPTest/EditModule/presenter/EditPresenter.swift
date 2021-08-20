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
    func updateImage(image: String)
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
        SQLiteCommands.updateRow(task: task)
        dataSource = SQLiteCommands.presentRows() ?? []
    }
    
    func createNewTask(_ eventValues:Task) {
        guard SQLiteCommands.insertRow(eventValues) != nil else {
            print("error")
            return
        }
    }
    
    func updateImage(image: String) {
        guard let task = SQLiteCommands.obtainTask(task: task)  else {
            print("image error")
            return
        }
        self.task = task
        self.task.image = image
        SQLiteCommands.updateRow(task: self.task)
    }
}
