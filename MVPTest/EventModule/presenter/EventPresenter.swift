//
//  EventPresenter.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 05.08.2021.
//

import Foundation

protocol EventViewProtocol: class {
    func saveEvent(text: String)
}

protocol EventViewPresenterProtocol: class {
    var router: AddEventRouterProtocol? { get set }
    var task: Task? { get set }
    func saveEvent(text: String)
}

class EventPresenter: EventViewPresenterProtocol {
    var task: Task?
    var router: AddEventRouterProtocol?
    weak var view: EventViewProtocol?
    
    required init(view: EventViewProtocol, task: Task?) {
        self.view = view
        self.task = task
    }
    
    func saveEvent(text: String) {
        let task = Task.init(nameEvent: text)
        DataBase.shared.addArrayOfEvent(addTask: task)
    }
}
