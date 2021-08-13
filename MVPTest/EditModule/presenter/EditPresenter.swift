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
    func editTextEvent()
    func transferDataTest()
    init(view: EditViewProtocol, task: Task)
}

class EditPresenter: EditViewPresenterProtocol {
   
    var task: Task
    var view: EditViewProtocol?
    var router: EditRouter?
    
    required init(view: EditViewProtocol, task: Task) {
        self.view = view
        self.task = task
    }

    func transferDataTest() {
        view?.transferData(task: task)
    }
    func editTextEvent() {
    }
}
