//
//  BluetoothSettingsCellModel.swift
//  HM12
//
//  Created by Александр Петрович on 27.12.2021.
//

import UIKit

extension Section {
    static func getBluetoothOnData() -> [Section] {
        return [
            Section(title: "", options: [
                CellModel(icon: UIImage(named: "Bluetooth"), title: "Bluetooth", style: .value1, detailTextLabel: nil, type: .switchCell)
            ]),
            Section(title: "МОИ УСТРОЙСТВА", options: [
                CellModel(icon: UIImage(named: "Apple whatch"), title: "Apple whatch", style: .value1, detailTextLabel: "Не подключено", type: .detailButton),
                CellModel(icon: UIImage(named: "Airpods"), title: "Airpods", style: .value1, detailTextLabel: "Не подключено", type: .detailButton)
            ])
        ]
    }
    
    static func getBluetoothOffData() -> [Section] {
        return [
            Section(title: "", options: [
                CellModel(icon: UIImage(named: "Bluetooth"), title: "Bluetooth", style: .value1, detailTextLabel: nil, type: .switchCell)
            ])]
    }
}
