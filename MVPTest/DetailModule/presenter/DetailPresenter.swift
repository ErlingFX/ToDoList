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
}
