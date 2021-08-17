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
    func deleteRowFromSQLiteDatabase(task: Task)
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
 
    func didTapPlusButton() {
        router?.showEventModule()
    }
    
    func beginDetail(task: Task) {
        router?.showDetailModule(task: task)
    }
    
    func connectToDatabase() {
        _ = SQLiteDatabase.sharedInstance
    }
    
    func loadDataFromSQLiteDatabase() {
        dataSource = SQLiteCommands.presentRows() ?? []
        print(dataSource)
        view?.reloadData()
    }
    
    func deleteRowFromSQLiteDatabase(task: Task) {
        
        SQLiteCommands.deleteRow(idTask: task.id ?? 0)
        dataSource = SQLiteCommands.presentRows() ?? []
        view?.reloadData()
        //обновить датасурс
    }
    
    
}
