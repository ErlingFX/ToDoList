//
//  DetailPresenter.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 05.08.2021.
//

import Foundation

protocol DetailViewProtocol: class {
    func setTask(task: Task?)
}

protocol DetailViewPresenterProtocol: class {
    init(view: DetailViewProtocol, task: Task)
    func setTaskTest()
    func beginEditScreen()
    func loadDataFromSQLiteDatabase(_ detailValues: Task)
}

class DetailPresenter: DetailViewPresenterProtocol {
    
    
    var router: DetailRouter?
    weak var view: DetailViewProtocol?
    var task: Task
    
    required init(view: DetailViewProtocol, task: Task) {
        self.view = view
        self.task = task
    }
    
    public func setTaskTest() {
        self.view?.setTask(task: task)
    }
    
   public func beginEditScreen() {
    router?.showEditModule(task: task)
    }
    
    func loadDataFromSQLiteDatabase(_ detailValues: Task) {
        guard SQLiteCommands.obtainTask(task: detailValues) != nil else {
            print("error")
            return
        }
    }
}
