//
//  MainViewController.swift
//  FirstTest
//
//  Created by Mac on 2023-10-10.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var mainView = MainView(frame: .zero)
    private lazy var mainModel = MainModel()
    private lazy var dataSourse = mainModel.dataSourse
    
    private lazy var busketModel = BusketModel()
    
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setDelegate()
        setBusketDelegate()
    }
}

extension MainViewController {
    private func setupNavigationBar() {
        let addNoteAction = UIAction { _ in
            let busketVC = BusketViewController()
            self.navigationController?.pushViewController(busketVC, animated: true)
        }
        
        navigationItem.title = "Cars"
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .organize, primaryAction: addNoteAction)
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSourse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarTableViewCell.reuseIdentifier, for: indexPath) as! CarTableViewCell
        let car = dataSourse[indexPath.row]
        cell.conigureCellforMain(with: car, action: getAction(for: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    private func setDelegate() {
        mainView.shopTable.dataSource = self
        mainView.shopTable.dataSource = self
    }
}

extension MainViewController: FromMainToBusketDelegate {
    func addCar(with car: Car) {
        busketModel.dataSourse.append(car)
    }
    
    private func setBusketDelegate() {
        busketModel.delegateFromMainToBusket = self
    }
    
    private func getAction(for indexPath: IndexPath) -> UIAction {
        let goToBusket = UIAction { [weak self] action in
            guard let self = self else { return }
            let car = self.dataSourse[indexPath.row]
            addCar(with: car)
            let busketVC = BusketViewController()
            self.navigationController?.pushViewController(busketVC, animated: true)
        }
        
        return goToBusket
    }
}

