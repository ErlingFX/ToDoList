//
//  ModuleBuilder.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 04.08.2021.
//

import UIKit

protocol AssamblyBuilderProtocol {
    static func createMainModule() -> UIViewController
    static func createDetailModule(task: Task?) -> UIViewController
    static func createEventModule() -> UIViewController
}

class AssamblyModuleBuilder: AssamblyBuilderProtocol {
    
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let presenter = MainPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    static func createEventModule() -> UIViewController {
        let view = EventViewController()
        let presenter = EventPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    static func createDetailModule(task: Task?) -> UIViewController {
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, task: task)
        view.presenter = presenter
        return view
    }
    
    
}
