//
//  SetCellStyle.swift
//  HM12
//
//  Created by Александр Петрович on 29.12.2021.
//

import UIKit

extension UIViewController {

    func setCellStyle(style: SettingCell.CellStyle) -> UITableViewCell {
        switch style {
        case .subtitle:
            return UITableViewCell(style: .subtitle, reuseIdentifier: idCell)
        case .value1:
            return UITableViewCell(style: .value1, reuseIdentifier: idCell)
        case .value2:
            return  UITableViewCell(style: .value2, reuseIdentifier: idCell)
        case .default:
            return  UITableViewCell(style: .default, reuseIdentifier: idCell)
        }
    }
}

