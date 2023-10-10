//
//  BusketModel.swift
//  FirstTest
//
//  Created by Mac on 2023-10-10.
//

import Foundation

class BusketModel {
    weak var delegateFromMainToBusket: FromMainToBusketDelegate?
    
    var dataSourse: [Car] = [
        Car(model: "niva2", cost: 200, imageName: "car"),
        Car(model: "niva809", cost: 1468345, imageName: "car"),
    ]
    
}
