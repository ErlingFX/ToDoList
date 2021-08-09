//
//  EventRouter.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 06.08.2021.
//

import UIKit

protocol AddEventRouter {
    var viewController: UIViewController? { get set }
    var assamblyBuilder: AssamblyBuilderProtocol? { get set }
}

protocol AddEventRouterProtocol: AddEventRouter {
    func showEventModule()
}


class EventRouter: AddEventRouterProtocol {
    var viewController: UIViewController?
    var assamblyBuilder: AssamblyBuilderProtocol?
    
    init(viewController: UIViewController, assamblyBuilder: AssamblyBuilderProtocol) {
        self.viewController = viewController
        self.assamblyBuilder = assamblyBuilder
    }
    
    func showEventModule() {
        if let viewController = viewController {
            guard let eventViewController = assamblyBuilder?.createEventModule(router: self, task: nil) else { return }
            viewController.navigationController?.pushViewController(eventViewController, animated: true)

        }
    }
}

//func showEventModule() {
//        if let navigationController = navigationController {
//            guard let eventViewController = assamblyBuilder?.createEventModule(router: self, task: nil) else { return }
//            navigationController.pushViewController(eventViewController, animated: true)
//        }
//    }
