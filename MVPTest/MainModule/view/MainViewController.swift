//
//  ViewController.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 04.08.2021.
//

import UIKit

class MainViewController: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet weak var maintableView: UITableView!
    
    var presenter: MainViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView()
        setupBarButton()
        
    }
    //MARK: - barButton
    private func setupBarButton() {
        navigationController?.navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: nil, style: .plain, target: self, action: #selector(onTapBarButton))
    }
    
    @objc private func onTapBarButton() {
        //ПИЛИТЬ СЮДА ПЕРЕХОД
//        let task = presenter.tasks
//        let detailViewController = ModuleBuilder.createDetailModule(task: task)
//        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    //MARK: - register TableView function
    func registerTableView() {
        maintableView.register(UINib(nibName: "TaskCell", bundle: nil), forCellReuseIdentifier: "TaskCell")
    }
}
//MARK: - data source
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = maintableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as? TaskCell {
            cell.textLabel?.text = "test"
            return cell
        }
        return UITableViewCell()
    }
}
//MARK: - extension presenterView

extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        
    }
}

//MARK: - delegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = presenter.tasks?[indexPath.row]
        let detailViewController = ModuleBuilder.createDetailModule(task: task)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

