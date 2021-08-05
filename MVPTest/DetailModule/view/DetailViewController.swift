//
//  DetailViewController.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 05.08.2021.
//

import UIKit

class DetailViewController: UIViewController {
    //MARK: - IBoutlet
    
    @IBOutlet weak var detailTaskLabel: UILabel!
    
    var presenter: DetailViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setTaskTest()
    }
}

extension DetailViewController: DetailViewProtocol {
    func setTask(task: Task?) {
        detailTaskLabel.text = task?.firstName
    } 
}
