//
//  MainPresenter.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 04.08.2021.
//

import Foundation

protocol MainViewProtocol: class {
   func reloadData()
}

protocol MainViewPresenterProtocol: class {
    var dataSource: [Task] { get set }
    func didTapPlusButton()
    func beginDetail(task: Task)
    func connectToDatabase()
    func loadDataFromSQLiteDatabase()
    //не дописал 2 метода роу ин секшн и селл фор роу ат
    //
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
    
    func connectToDatabase() {
        _ = SQLiteDatabase.sharedInstance
    }
    
    func loadDataFromSQLiteDatabase() {
        dataSource = SQLiteCommands.presentRows() ?? []
        view?.reloadData()
    }
    
    func didTapPlusButton() {
        router?.showEventModule()
    }
    
    func beginDetail(task: Task) {
        router?.createDetailModule(task: task)
    }
}
