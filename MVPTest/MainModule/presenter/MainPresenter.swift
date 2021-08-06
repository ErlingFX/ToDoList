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
    //TO-DO добавить базу данных в инициалазтор
    var router: ModuleBuilder! { get set }
    var dataSource: [Task] { get }
    func didTapPlusButton()
}

class MainPresenter: MainViewPresenterProtocol {
    var dataSource: [Task] = [Task(nameEvent: "Купить молоко")]
    var router: ModuleBuilder!
    weak var view: MainViewProtocol?
//    var view: MainViewProtocol
    
    required init(view: MainViewProtocol) {
        self.view = view
    }
    
    func didTapPlusButton() {
        ModuleBuilder.createEventModule()
        
        
    }
}
