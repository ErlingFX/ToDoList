//
//  EventPresenter.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 05.08.2021.
//

import Foundation

protocol EventViewProtocol: class {
    
}

protocol EventViewPresenterProtocol: class {
    var router: AddEventRouterProtocol? { get set }
    var task: Task? { get set }
    func createNewTask(_ eventValues:Task)
}

class EventPresenter: EventViewPresenterProtocol {
    var task: Task?
    var router: AddEventRouterProtocol?
    weak var view: EventViewProtocol?
    
    required init(view: EventViewProtocol, task: Task?) {
        self.view = view
        self.task = task
    }
   
    //MARK: - Create new task
    func createNewTask(_ eventValues:Task) {
        guard SQLiteCommands.insertRow(eventValues) != nil else {
            print("error")
            return
        }
    }
}
