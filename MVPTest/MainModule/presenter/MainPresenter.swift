//
//  MainPresenter.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 04.08.2021.
//

import Foundation

protocol MainViewProtocol: class {
    func obtainData()
}

protocol MainViewPresenterProtocol: class {
    var dataSource: [Task] { get set }
    func didTapPlusButton()
    func beginDetail(task: Task)
    init(view: MainViewProtocol, router: MainRouterProtocol)
}

class MainPresenter: MainViewPresenterProtocol {
    weak var view: MainViewProtocol?
    var dataSource: [Task] = []
    var router: MainRouterProtocol?
    
    required init(view: MainViewProtocol, router: MainRouterProtocol) {
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
