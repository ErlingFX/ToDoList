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
    @IBOutlet weak var detailDateLabel: UILabel!
    @IBOutlet weak var editButtView: UIView!
    @IBOutlet weak var editButtLabel: UIButton!
    @IBOutlet weak var backroundImageView: UIImageView!
    
    var presenter: DetailViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setTaskTest()
        configureEditButt()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.loadDataFromSQLiteDatabase()
        
    }
    
    private func configureEditButt() {
        editButtView.backgroundColor = #colorLiteral(red: 0.8275728822, green: 0.9524832368, blue: 0.9309189916, alpha: 0.8467817496)
        editButtView.layer.cornerRadius = editButtView.bounds.height / 2
    }
    
    @IBAction func editButtAction(_ sender: Any) {
        self.presenter.beginEditScreen()
    }
}

extension DetailViewController: DetailViewProtocol {
    func setTask(task: Task?) {
        detailTaskLabel.text = task?.nameEvent
        detailDateLabel.text = "\(DateFormatter.created.string(from: task!.createdDateEvent ))"
        
    }
}
