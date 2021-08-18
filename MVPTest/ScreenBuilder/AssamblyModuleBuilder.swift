//
//  ModuleBuilder.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 04.08.2021.
//

import UIKit

protocol AssamblyBuilderProtocol {
    func createMainModule(router: MainRouter) -> UIViewController
    func createEventModule(router: EventRouter, task: Task?) -> UIViewController
    func createDetailModule(task: Task, router: DetailRouter) -> UIViewController
    func createEditModule(task: Task, router: EditRouter) -> UIViewController
//    func createImagePicker() -> UIViewController
}

class AssamblyModuleBuilder: AssamblyBuilderProtocol {
    
    func createMainModule(router: MainRouter) -> UIViewController {
        let view = MainViewController()
        let presenter = MainPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createEventModule(router: EventRouter, task: Task?) -> UIViewController {
        let view = EventViewController()
        let presenter = EventPresenter(view: view, task: task)
        presenter.router = router
        view.presenter = presenter
        return view
    }
    
    func createDetailModule(task: Task, router: DetailRouter) -> UIViewController {
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, task: task)
        presenter.router = router
        view.presenter = presenter
        return view
    }
    
    func createEditModule(task: Task, router: EditRouter) -> UIViewController {
        let view = EditViewController()
        let presenter = EditPresenter(view: view, task: task)
        presenter.router = router
        view.presenter = presenter
        return view
    }
}

