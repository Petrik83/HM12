//
//  SetCellStyle.swift
//  HM12
//
//  Created by Александр Петрович on 29.12.2021.
//

import UIKit

extension UIViewController {

    func setCellStyle(style: CellModel.CellStyle) -> UITableViewCell {
        switch style {
        case .subtitle:
            return UITableViewCell(style: .subtitle, reuseIdentifier: ViewController.idCell)
        case .value1:
            return UITableViewCell(style: .value1, reuseIdentifier: ViewController.idCell)
        case .value2:
            return  UITableViewCell(style: .value2, reuseIdentifier: ViewController.idCell)
        case .default:
            return  UITableViewCell(style: .default, reuseIdentifier: ViewController.idCell)
        }
    }
}

