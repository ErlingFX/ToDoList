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
        let myButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onTapBarButton))
        
        navigationItem.rightBarButtonItem = myButton
    }
    
    //MARK: - selector func barButton
    @objc private func onTapBarButton() {
        self.presenter.didTapPlusButton()
//        navigationController?.pushViewController(eventViewController, animated: true)
    }
    
    //MARK: - register TableView function
    func registerTableView() {
        maintableView.register(UINib(nibName: "TaskCell", bundle: nil), forCellReuseIdentifier: "TaskCell")
    }
}

//MARK: - data source
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = maintableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as? TaskCell {
            let model = presenter.dataSource[indexPath.row]
            cell.configureCell(task: model)
            return cell
        }
        return UITableViewCell()
    }
}
//MARK: - delegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = presenter.dataSource[indexPath.row]
        presenter.beginDetail(task: task)
//        let detailViewController = AssamblyModuleBuilder.createDetailModule(task: task)
//        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
//MARK: - extension presenterView

extension MainViewController: MainViewProtocol {
    
}

