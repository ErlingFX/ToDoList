//
//  EditViewController.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 12.08.2021.
//

import UIKit

class EditViewController: UIViewController{
    
    var presenter: EditViewPresenterProtocol!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var editImage: UIImageView!
    @IBOutlet weak var editNameEventLabel: UILabel!
    @IBOutlet weak var editButtonLabel: UIButton!
    @IBOutlet weak var addImageLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.transferDataTest()
        
    }
    
    @IBAction func editButtonAction(_ sender: Any) {
        editButtonLabel.setTitle("...", for: .normal)
        editTaskAlert(title: "Редактирование", message: "", style: .alert)
    }
    
    private func editTaskAlert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let action = UIAlertAction(title: "ok", style: .default) { [weak self] (action) in
            
            guard let text = alertController.textFields?.first?.text else { return }
            guard let self = self else { return }
            
            self.editNameEventLabel.text = text
            self.presenter.task.nameEvent = text
            self.presenter.updateRowFromSQLiteDatabase(task: self.presenter.task)
        }
        alertController.addTextField { (textField) in
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension EditViewController: EditViewProtocol {
    func transferData(task: Task?) {
        editNameEventLabel.text = task?.nameEvent
        editImage.layer.cornerRadius = 15
    }
}

extension EditViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBAction func addImageAction(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        //add router
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            
            guard let ds = image.saveImage() else {
                return
            }
            presenter.updateImage(image: ds)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
