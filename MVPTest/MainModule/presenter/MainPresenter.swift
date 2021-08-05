//
//  MainPresenter.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 04.08.2021.
//

import Foundation

protocol MainViewProtocol: class {
    
    //    func setGreeting(greeting: String)
}

protocol MainViewPresenterProtocol: class {
    //TO-DO добавить базу данных в инициалазтор
    init(view: MainViewProtocol)
    var tasks: [Task]? { get set }
    //    func showGreeeting()
}

class MainPresenter: MainViewPresenterProtocol {
    weak var view: MainViewProtocol?
    var tasks: [Task]?
    
    required init(view: MainViewProtocol) {
        self.view = view
    }
}
