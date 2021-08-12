//
//  DetailRouter.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 06.08.2021.
//

import UIKit

protocol MainDetailRouter {
    var viewController: UIViewController? { get set }
    var assamblyBuilder: AssamblyBuilderProtocol? { get set }
}

protocol DetailRouterProtocol: MainDetailRouter {
    //    TO-DO запилить редактирование
}

class DetailRouter: DetailRouterProtocol {
    var viewController: UIViewController?
    var assamblyBuilder: AssamblyBuilderProtocol?
    
    init(viewController: UIViewController, assamblyBuilder: AssamblyBuilderProtocol) {
        self.viewController = viewController
        self.assamblyBuilder = assamblyBuilder
    }
}


