//
//  EditViewController.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 12.08.2021.
//

import UIKit

class EditViewController: UIViewController, UITextFieldDelegate{
    var presenter: EditViewPresenterProtocol!
    
    //MARK: - IBOutlet
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var editTextFiled: UITextField!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var editImage: UIImageView!
    @IBOutlet weak var editNameEventLabel: UILabel!
    @IBOutlet weak var editButtonLabel: UIButton!
    @IBOutlet weak var addImageLabel: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.transferDataTest()
    }
    override func viewWillAppear(_ animated: Bool) {
        editTextFiled.center.x += view.bounds.width
        saveButton.center.x += view.bounds.width
        configureAnimate()
    }
    
    //MARK: - Кнопка вызова и изменения текста в таске
    @IBAction func editButtonAction(_ sender: UIButton) {
        moveTo()
    }
    
    //MARK: - Кнопка сохранения для текстфилда
    @IBAction func editTFsaveButt(_ sender: UIButton) {
        // если текст есть то
        if editTextFiled.hasText {
            guard let text = self.editTextFiled.text else { return }
            self.editNameEventLabel.text = text
            self.presenter.task.nameEvent = text
            self.presenter.updateRowFromSQLiteDatabase(task: self.presenter.task)
            moveToBack()
            editTextFiled.resignFirstResponder()
            editTextFiled.text = ""
            //если нету
        } else {
            notextTF()
        }
    }
}

//MARK: - datePickerVC
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
    
    //MARK: - no text in TF animate
    func notextTF() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: editTextFiled.center.x - 10, y: editTextFiled.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: editTextFiled.center.x + 10, y: editTextFiled.center.y))
        editTextFiled.layer.add(animation, forKey: "position")
        editTextFiled.placeholder = "not input text"
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.editTextFiled.placeholder = "enter your task"
        }
    }
    
    //MARK: - animate
    func configureAnimate() {
        
        editNameEventLabel.layer.cornerRadius = 15
        editImage.layer.cornerRadius = 15
        
        editNameEventLabel.center.x += view.bounds.width
        editNameEventLabel.clipsToBounds = true
        addImageLabel.center.x += view.bounds.width
        editImage.center.y += view.bounds.width
        
        UIView.animate(withDuration: 2.0) {
            self.editNameEventLabel.center.x -= self.view.bounds.width
        }
        UIView.animate(withDuration: 2.0) {
            self.addImageLabel.center.x += self.view.bounds.width
        }
        UIView.animate(withDuration: 2.0) {
            self.editImage.center.x += self.view.bounds.width
        }
    }
    //MARK: - animate and configure TF
    private func moveTo() {
        UIView.animate(withDuration: 1.5) {
            self.editTextFiled.center.x -= self.view.bounds.width
        }
        UIView.animate(withDuration: 2.0) {
            self.saveButton.center.x -= self.view.bounds.width
        }
        UIView.animate(withDuration: 1.5) {
            self.editNameEventLabel.center.x -= self.view.bounds.width
        }
    }
    private func moveToBack() {
        UIView.animate(withDuration: 1.5) {
            self.editTextFiled.center.x += self.view.bounds.width
        }
        UIView.animate(withDuration: 2.0) {
            self.saveButton.center.x += self.view.bounds.width
        }
        UIView.animate(withDuration: 1.5) {
            self.editNameEventLabel.center.x += self.view.bounds.width
        }
    }
}

extension EditViewController: EditViewProtocol {
    func transferData(task: Task?) {
        editNameEventLabel.text = task?.nameEvent
        
    }
}
