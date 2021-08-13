//
//  DetailRouter.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 06.08.2021.
//

import UIKit

protocol MainDetailRouter {
    var navigationController: UINavigationController { get set }
    var assamblyBuilder: AssamblyBuilderProtocol { get set }
}

protocol DetailRouterProtocol: MainDetailRouter {
    //    TO-DO запилить редактирование
    func showEditModule(task: Task)
}

class DetailRouter: DetailRouterProtocol {
    var assamblyBuilder: AssamblyBuilderProtocol
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, assamblyBuilder: AssamblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assamblyBuilder = assamblyBuilder
    }
    
    func showEditModule(task: Task) {
        let editRouter = EditRouter(navigationController: navigationController)
        let editViewController = assamblyBuilder.createEditModule(task: task, router: editRouter)
        navigationController.pushViewController(editViewController, animated: true)
    }
}


