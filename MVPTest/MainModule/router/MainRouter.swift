//
//  MainRouter.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 06.08.2021.
//

import Foundation
import UIKit

protocol MainRouterMain {
    var viewController: UINavigationController { get set }
    var assamblyBuilder: AssamblyBuilderProtocol { get set }
}

protocol MainRouterProtocol: MainRouterMain {
    func initialViewController()
    func showEventModule()
    func showDetailModule(task: Task)
}

class MainRouter: MainRouterProtocol {
    var viewController: UINavigationController
    var assamblyBuilder: AssamblyBuilderProtocol
    
    
    init(viewController: UINavigationController, assamblyBuilder: AssamblyBuilderProtocol) {
        self.viewController = viewController
        self.assamblyBuilder = assamblyBuilder
    }
    
    func initialViewController() {
        let mainViewController = assamblyBuilder.createMainModule(router: self)
        viewController.viewControllers = [mainViewController]
    }
    
    func showEventModule() {
        let eventRouter = EventRouter(navigationController: viewController)
        let eventViewController = assamblyBuilder.createEventModule(router: eventRouter, task: nil)
        viewController.pushViewController(eventViewController, animated: true)
    }
    
    func showDetailModule(task: Task) {
        let detailViewController = assamblyBuilder.createDetailModule(task: task, router: self)
        viewController.pushViewController(detailViewController, animated: true)
    }
}
