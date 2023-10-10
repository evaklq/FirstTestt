//
//  BusketView.swift
//  FirstTest
//
//  Created by Mac on 2023-10-10.
//

import UIKit

class BusketView: UIView {
    
    lazy var shopTable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(CarTableViewCell.self, forCellReuseIdentifier: CarTableViewCell.reuseIdentifier)
        return table
    }()
    
    lazy var summCostOfCars: UILabel = {
        let label = UILabel()
        label.text = "Busket cost: "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    lazy var amountOfCars: UILabel = {
        let label = UILabel()
        label.text = "Amount of cars: "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BusketView {
    private func setupLayouts() {
        addSubview(shopTable)
        addSubview(summCostOfCars)
        addSubview(amountOfCars)
        
        NSLayoutConstraint.activate([
            shopTable.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            shopTable.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            shopTable.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            shopTable.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -400),
            
            amountOfCars.leadingAnchor.constraint(equalTo: shopTable.leadingAnchor, constant: 10),
            amountOfCars.topAnchor.constraint(equalTo: shopTable.bottomAnchor, constant: 6),
            
            summCostOfCars.leadingAnchor.constraint(equalTo: amountOfCars.leadingAnchor),
            summCostOfCars.topAnchor.constraint(equalTo: amountOfCars.bottomAnchor, constant: 10),
        ])
    }
}

