//
//  Router.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 06.08.2021.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assamblyBuilder: AssamblyBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showEventModule()
    func createDetailModule()
    func popToRoot()
    
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assamblyBuilder: AssamblyBuilderProtocol?
    
    init(navigationController: UINavigationController, assamblyBuilder: AssamblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assamblyBuilder = assamblyBuilder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = assamblyBuilder?.createMainModule(router: self) else { return }
            navigationController.viewControllers = [mainViewController]
        }
    }
    
    func showEventModule() {
        if let navigationController = navigationController {
            guard let eventViewController = assamblyBuilder?.createEventModule(router: self, task: nil) else { return }
            navigationController.pushViewController(eventViewController, animated: true)
        }
    }
    
    func createDetailModule() {
        if let navigationController = navigationController {
            guard let detailViewController = assamblyBuilder?.createDetailModule(task: nil, router: self) else { return }
            navigationController.pushViewController(detailViewController, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
