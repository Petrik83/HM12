//
//  WiFiSettingsCellModel.swift
//  HM12
//
//  Created by Александр Петрович on 27.12.2021.
//

import UIKit

extension Section {
    static func getWiFiData() -> [Section] {
        return [
            Section(title: "", options: [
                SettingCell(icon: UIImage(named: "Wi-Fi"), title: "Wi-Fi", style: .default, detailTextLabel: nil, type: .switchCell)
            ]),
            Section(title: "МОИ СЕТИ", options: [
                SettingCell(icon: UIImage(named: "macWiFi"), title: "macWiFi", style: .default, detailTextLabel: nil, type: .detailButton),
                SettingCell(icon: UIImage(named: "avia8-1 net"), title: "avia8-1 net", style: .default, detailTextLabel: nil, type: .detailButton),
                SettingCell(icon: UIImage(named: "free Wi-Fi"), title: "free Wi-Fi", style: .default, detailTextLabel: nil, type: .detailButton)
            ])
        ]
    }
}
