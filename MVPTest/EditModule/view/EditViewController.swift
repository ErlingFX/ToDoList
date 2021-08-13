//
//  EditViewController.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 12.08.2021.
//

import UIKit

class EditViewController: UIViewController {
    
    var presenter: EditViewPresenterProtocol!
    
    @IBOutlet weak var editNameEventLabel: UILabel!
    @IBOutlet weak var editButtonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func editButtonAction(_ sender: Any) {
        editButtonLabel.setTitle("...", for: .normal)
        editButtonLabel.setImage(UIImage(named:"editImage"), for: .normal)
    }
}

extension EditViewController: EditViewProtocol {
    
}
