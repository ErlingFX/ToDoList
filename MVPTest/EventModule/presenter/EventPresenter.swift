//
//  EventPresenter.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 05.08.2021.
//

import Foundation

protocol EventViewProtocol: class {
//    func showDetail()
}

protocol EventViewPresenterProtocol: class {
    var router: ModuleBuilder! { get set }
    var dataSource: [Task]? { get }
    func saveEvent()
}

class EventPresenter: EventViewPresenterProtocol {
    var dataSource: [Task]?
    var router: ModuleBuilder!
    weak var view: EventViewProtocol?
    
    
    required init(view: EventViewProtocol) {
        self.view = view
    }
    
    func saveEvent() {
        
    }
}
