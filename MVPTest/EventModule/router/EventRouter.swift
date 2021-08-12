//
//  EventRouter.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 06.08.2021.
//

import UIKit

protocol AddEventRouter {
    var navigationController: UINavigationController? { get set }
}

protocol AddEventRouterProtocol: AddEventRouter {
    func pop()
}

class EventRouter: AddEventRouterProtocol {
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func pop() {
        navigationController?.popToRootViewController(animated: true)
    }
}



