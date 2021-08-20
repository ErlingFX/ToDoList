//
//  DetailPresenter.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 05.08.2021.
//

import Foundation

protocol DetailViewProtocol {
    func setTask(task: Task?)
}

protocol DetailViewPresenterProtocol {
    init(view: DetailViewProtocol, task: Task)
    func setTaskTest()
    func beginEditScreen()
    func loadDataFromSQLiteDatabase()
}

class DetailPresenter: DetailViewPresenterProtocol {
    
    
    var router: DetailRouter?
    var view: DetailViewProtocol?
    var task: Task
    
    required init(view: DetailViewProtocol, task: Task) {
        self.view = view
        self.task = task
    }
    
    public func setTaskTest() {
        view?.setTask(task: task)
    }
    
   public func beginEditScreen() {
    router?.showEditModule(task: task)
    }
    
    func loadDataFromSQLiteDatabase() {
        guard let taskNew = SQLiteCommands.obtainTask(task: task) else {
            print("error detailValue")
            return
        }
        
        self.task = taskNew
        view?.setTask(task: task)
    }
}
