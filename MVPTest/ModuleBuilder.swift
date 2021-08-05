//
//  ModuleBuilder.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 04.08.2021.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
    static func createDetailModule(task: Task?) -> UIViewController
}

class ModuleBuilder: Builder {
   
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let presenter = MainPresenter(view: view)
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
