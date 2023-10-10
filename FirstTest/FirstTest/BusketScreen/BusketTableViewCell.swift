//
//  BusketTableViewCell.swift
//  FirstTest
//
//  Created by Mac on 2023-10-10.
//

import UIKit

class BusketTableViewCell: UITableViewCell {
    
}

// MARK: - ViewCell settings
extension BusketTableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    func conigureCell(with car: Car, action: UIAction) {
        carImage.image = UIImage(named: car.imageName)
        modelLabel.text = car.model
        costLabel.text = "Cost:" + String(car.cost)
        addToBusketButton.addAction(action, for: .touchUpInside)
    }
}
