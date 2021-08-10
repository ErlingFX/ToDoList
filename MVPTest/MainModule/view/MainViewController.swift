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
        configureTableView()
        setupBarButton()
        presenter.connectToDatabase()
     
    }
    
    //MARK: - Load data from SQLite database
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.loadDataFromSQLiteDatabase()
    }
    //MARK: - barButton
    private func setupBarButton() {
        let myButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onTapBarButton))
        navigationItem.rightBarButtonItem = myButton
        self.navigationController!.navigationBar.topItem!.title = "ToDoList"
    }
    
    //MARK: - selector func barButton
    @objc private func onTapBarButton() {
        self.presenter.didTapPlusButton()
    }
    
    //MARK: - register TableView function
    func configureTableView() {
        maintableView.register(UINib(nibName: "TaskCell", bundle: nil), forCellReuseIdentifier: "TaskCell")
//        maintableView.insetsContentViewsToSafeArea = true
    }
}

//MARK: - data source
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = maintableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as? TaskCell {
            cell.layer.cornerRadius = 12
            cell.layer.borderWidth = 2
            let model = presenter.dataSource[indexPath.row]
            cell.configureCell(model)
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
    }
    
    // Высота ячейки
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 120
//
//    }
    //Header tv
    
    
    
    //Delete cell
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            maintableView.beginUpdates()
            maintableView.deleteRows(at: [indexPath], with: .fade)
           maintableView.endUpdates()
        }
    }
}
//MARK: - extension presenterView
extension MainViewController: MainViewProtocol {
    func reloadData() {
        maintableView.reloadData()
    }
}

