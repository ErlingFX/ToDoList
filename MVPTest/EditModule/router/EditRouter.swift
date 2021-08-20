//
//  EditRouter.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 12.08.2021.
//

import UIKit

protocol MainEditRouter {
    var navigationController: UINavigationController { get set }
    
}

protocol EditRouterProtocol: MainEditRouter {
    func pop()
    func presentVCpicker()
}

class EditRouter: EditRouterProtocol {
    
    var navigationController: UINavigationController
    var assamblyBuilder: AssamblyBuilderProtocol?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func pop() {
        navigationController.popViewController(animated: true)
    }
    
    func presentVCpicker() {
        navigationController.present(navigationController, animated: true, completion: nil)
    }
}
