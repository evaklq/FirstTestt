//
//  BusketViewController.swift
//  FirstTest
//
//  Created by Mac on 2023-10-10.
//

import UIKit

protocol FromMainToBusketDelegate: AnyObject {
    func addCar(with car: Car)
}

enum TableSection {
    case main
    case new
}

class BusketViewController: UIViewController {
    
    private lazy var busketView = BusketView(frame: .zero)
    private lazy var busketModel = BusketModel()
    private lazy var cars = busketModel.dataSourse
    
    private var dataSourse: UITableViewDiffableDataSource<TableSection, Car>?
    
    override func loadView() {
        view = busketView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupDataSourse()
        updateDataSourse(with: cars)
        countAmountOfCarsAndCost()
    }
}

extension BusketViewController {
    private func setupNavigationBar() {
        navigationItem.title = "Busket"
    }
}

extension BusketViewController {
    private func setupDataSourse() {
        dataSourse = UITableViewDiffableDataSource(tableView: busketView.shopTable, cellProvider: { tableView, indexPath, car in
            let cell = tableView.dequeueReusableCell(withIdentifier: CarTableViewCell.reuseIdentifier, for: indexPath) as! CarTableViewCell
            cell.conigureCellforBusket(with: car, action: self.getAction(index: indexPath))
            return cell
        })
    }
    
    private func updateDataSourse(with car: [Car]) {
        var snapshot = NSDiffableDataSourceSnapshot<TableSection, Car>()
        snapshot.appendSections([.main])
        snapshot.appendItems(cars)
        dataSourse?.apply(snapshot, animatingDifferences: false)
    }
}

extension BusketViewController {
    private func getAction(index: IndexPath) -> UIAction{
        let goToBusket = UIAction { _ in
            self.cars.remove(at: index.row)
            self.updateDataSourse(with: self.cars)
            self.updateCount()
        }
        return goToBusket
    }
}

extension BusketViewController {
    private func countAmountOfCarsAndCost() {
        let amount = cars.count
        var cost = 0.0
        
        for car in cars {
            cost += car.cost
        }
        busketView.amountOfCars.text! += String(amount)
        busketView.summCostOfCars.text! += String(cost)
    }
    
    private func updateCount() {
        let amount = cars.count
        var cost = 0.0
        
        for car in cars {
            cost += car.cost
        }
        busketView.amountOfCars.text! = "Amount of cars: " + String(amount)
        busketView.summCostOfCars.text! = "Busket cost: " + String(cost)
    }
}
