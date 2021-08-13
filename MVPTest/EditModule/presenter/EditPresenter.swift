//
//  EditPresenter.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 12.08.2021.
//

import Foundation

protocol EditViewProtocol {
    
}

protocol EditViewPresenterProtocol {
    func editTextEvent()
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

    func editTextEvent() {
    }
}
