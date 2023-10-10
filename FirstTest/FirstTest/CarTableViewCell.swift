//
//  CarTableViewCell.swift
//  FirstTest
//
//  Created by Mac on 2023-10-10.
//

import UIKit

class CarTableViewCell: UITableViewCell {
    
    private lazy var carImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "car")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var modelLabel: UILabel = {
        let label = UILabel()
        label.text = "model"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var costLabel: UILabel = {
        let label = UILabel()
        label.text = "cost"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var addToBusketButton: UIButton = {
        let button = UIButton()
        var config = createBaseConfiguration(title: "add to busket")
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Constraints
extension CarTableViewCell {
    private func setupLayouts() {
        
        let descriptionStackView = UIStackView(arrangedSubviews: [modelLabel, costLabel])
        descriptionStackView.axis = .vertical
        descriptionStackView.spacing = 5
        descriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(carImage)
        contentView.addSubview(descriptionStackView)
        contentView.addSubview(addToBusketButton)
        
        NSLayoutConstraint.activate([
            carImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            carImage.heightAnchor.constraint(equalToConstant: 40),
            carImage.widthAnchor.constraint(equalToConstant: 40),
            carImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            descriptionStackView.heightAnchor.constraint(equalTo: carImage.heightAnchor, multiplier: 1),
            descriptionStackView.leadingAnchor.constraint(equalTo: carImage.trailingAnchor, constant: 5),
            descriptionStackView.centerYAnchor.constraint(equalTo: carImage.centerYAnchor),
            
            addToBusketButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            addToBusketButton.centerYAnchor.constraint(equalTo: carImage.centerYAnchor)
        ])
    }
}

// MARK: - ViewCell settings
extension CarTableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    func conigureCellforMain(with car: Car, action: UIAction) {
        carImage.image = UIImage(named: car.imageName)
        modelLabel.text = car.model
        costLabel.text = "Cost:" + String(car.cost)
        addToBusketButton.addAction(action, for: .touchUpInside)
    }
    
    func conigureCellforBusket(with car: Car, action: UIAction) {
        carImage.image = UIImage(named: car.imageName)
        modelLabel.text = car.model
        costLabel.text = "Cost:" + String(car.cost)
        addToBusketButton.addAction(action, for: .touchUpInside)
        addToBusketButton.titleLabel?.text = "delete"
    }
}

// MARK: - Support things
extension CarTableViewCell {
    private func createBaseConfiguration(title: String) -> UIButton.Configuration {
        var configuration = UIButton.Configuration.filled()
        configuration.baseForegroundColor = .black
        configuration.baseBackgroundColor = .systemFill
        configuration.title = title
        return configuration
    }
}


