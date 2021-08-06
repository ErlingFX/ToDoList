//
//  ModuleBuilder.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 04.08.2021.
//

import UIKit

protocol AssamblyBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController
    func createDetailModule(task: Task?, router: RouterProtocol) -> UIViewController
    func createEventModule(router: RouterProtocol, task: Task?) -> UIViewController
}

class AssamblyModuleBuilder: AssamblyBuilderProtocol {
    
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let presenter = MainPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createEventModule(router: RouterProtocol, task: Task?) -> UIViewController {
        let view = EventViewController()
        let presenter = EventPresenter(view: view, task: task)
        view.presenter = presenter
        return view
    }
    
    func createDetailModule(task: Task?, router: RouterProtocol) -> UIViewController {
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, task: task)
        view.presenter = presenter
        return view
    }
}
