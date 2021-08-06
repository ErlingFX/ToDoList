//
//  EventPresenter.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 05.08.2021.
//

import Foundation

protocol EventViewProtocol: class {
    func saveEvent(task: Task?)
}

protocol EventViewPresenterProtocol: class {
    var router: AssamblyModuleBuilder! { get set }
    var task: Task? { get set }
    func saveEvent()
}

class EventPresenter: EventViewPresenterProtocol {
    var task: Task?
    var router: AssamblyModuleBuilder!
    weak var view: EventViewProtocol?
    
    required init(view: EventViewProtocol, task: Task?) {
        self.view = view
        self.task = task
    }
    
    func saveEvent() {
        self.view?.saveEvent(task: task)
    }
}
