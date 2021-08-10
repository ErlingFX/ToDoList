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
        
        createTable()
    }
    
    //MARK: - Connect to database and create table.
    private func createTable() {
        let database = SQLiteDatabase.sharedInstance
        database.createTable()
    }
    
    
    //MARK: - IBAction
    @IBAction func saveEventButton(_ sender: Any) {
//        let id: Int = 0
        let textEvent = insertTextEvent.text ?? ""
//        let eventValues = Task(id: id, nameEvent: textEvent)
        let eventValues = Task(nameEvent: textEvent)
        
        presenter.createNewTask(eventValues)
        presenter.router?.pop()
    
    }
}
//MARK: - extension presenterView
extension EventViewController: EventViewProtocol {
}

