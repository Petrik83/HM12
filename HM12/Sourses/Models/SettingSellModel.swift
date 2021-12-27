//
//  SettingSellModel.swift
//  HM12
//
//  Created by Александр Петрович on 27.12.2021.
//

import UIKit

struct SettingCell {
    
    enum CellAccecoryType {
        case switchCell
        case disclosureIndicator
        case detailButton
    }

    enum CellStyle {
        case subtitle, value1, value2, `default`
    }
    
    let icon: UIImage?
    let title: String
    let style: CellStyle
    var detailTextLabel: String?
    let type: CellAccecoryType?
}

struct Section {
    let title: String
    let options: [SettingCell]
}

extension Section {
    static func getData() -> [Section] {
        return [
            Section(title: "", options: [
                SettingCell(icon: UIImage(named: "Александр Петрович"), title: "Александр Петрович", style: .subtitle, detailTextLabel: "Apple ID, iCloud, контент и покупки", type: .disclosureIndicator)
            ]),
            Section(title: "", options: [
                SettingCell(icon: UIImage(named: "Авиарежим"), title: "Авиарежим", style: .default, detailTextLabel: nil, type: .switchCell),
                SettingCell(icon: UIImage(named: "Wi-Fi"), title: "Wi-Fi", style: .value1, detailTextLabel: "Вкл.", type: .disclosureIndicator),
                SettingCell(icon: UIImage(named: "Bluetooth"), title: "Bluetooth", style: .value1, detailTextLabel: "Выкл.", type: .disclosureIndicator),
                SettingCell(icon: UIImage(named: "Сотовая связь"), title: "Сотовая связь", style: .value1, detailTextLabel: "", type: .disclosureIndicator),
                SettingCell(icon: UIImage(named: "Режим модема"), title: "Режим модема", style: .value1, detailTextLabel: "", type: .disclosureIndicator),
                SettingCell(icon: UIImage(named: "VPN"), title: "VPN", style: .value1, detailTextLabel: "Не подключено", type: .disclosureIndicator)
            ]),
            Section(title: "", options: [
                SettingCell(icon: UIImage(named: "Уведомления"), title: "Уведомления", style: .default, detailTextLabel: nil, type: .disclosureIndicator),
                SettingCell(icon: UIImage(named: "Звуки, тактильные сигналы"), title: "Звуки, тактильные сигналы", style: .default, detailTextLabel: nil, type: .disclosureIndicator),
                SettingCell(icon: UIImage(named: "Фокусирование"), title: "Фокусирование", style: .default, detailTextLabel: nil, type: .disclosureIndicator),
                SettingCell(icon: UIImage(named: "Экранное время"), title: "Экранное время", style: .default, detailTextLabel: nil, type: .disclosureIndicator)
            ]),
            Section(title: "", options: [
                SettingCell(icon: UIImage(named: "Основные"), title: "Основные", style: .default, detailTextLabel: nil, type: .disclosureIndicator),
                SettingCell(icon: UIImage(named: "Пункт управления"), title: "Пункт управления", style: .default, detailTextLabel: nil, type: .disclosureIndicator),
                SettingCell(icon: UIImage(named: "Экран и яркость"), title: "Экран и яркость", style: .default, detailTextLabel: nil, type: .disclosureIndicator),
                SettingCell(icon: UIImage(named: "Экран 'Домой'"), title: "Экран \"Домой\"", style: .default, detailTextLabel: nil, type: .disclosureIndicator),
            ])
        ]
    }
}
