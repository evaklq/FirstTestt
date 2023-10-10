//
//  MainView.swift
//  FirstTest
//
//  Created by Mac on 2023-10-10.
//

import UIKit

class MainView: UIView {
    
    lazy var shopTable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(CarTableViewCell.self, forCellReuseIdentifier: CarTableViewCell.reuseIdentifier)
        return table
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

extension MainView {
    private func setupLayouts() {
        addSubview(shopTable)
        
        NSLayoutConstraint.activate([
            shopTable.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            shopTable.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            shopTable.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            shopTable.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
