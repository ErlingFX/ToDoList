//
//  EventViewController.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 05.08.2021.
//

import UIKit

class EventViewController: UIViewController {
    
    //MARK: - IBOtlet
    @IBOutlet weak var insertTextEvent: UITextField!
    
    var presenter: EventViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //MARK: - IBAction
    @IBAction func saveEventButton(_ sender: Any) {
//        insertTextEvent.text?.append(contentsOf: presenter.dataSource)
    }
}
    //MARK: - extension presenterView
    extension EventViewController: EventViewProtocol {
    }

