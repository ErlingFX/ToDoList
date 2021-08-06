//
//  MainPresenter.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 04.08.2021.
//

import Foundation

protocol MainViewProtocol: class {
    
}

protocol MainViewPresenterProtocol: class {
    var dataSource: [Task] { get set }
    func didTapPlusButton()
    func beginDetail(task: Task)
    init(view: MainViewProtocol, router: RouterProtocol)
}

class MainPresenter: MainViewPresenterProtocol {
    weak var view: MainViewProtocol?
    var dataSource: [Task] = [Task(nameEvent: "Купить молоко")]
    var router: RouterProtocol?
    
    required init(view: MainViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func didTapPlusButton() {
        router?.showEventModule()
    }
    
    func beginDetail(task: Task) {
        router?.createDetailModule(task: task)
    }
}
