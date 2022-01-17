//
//  ViewControllerDelegat.swift
//  HM12
//
//  Created by Aliaksandr Piatrovich on 17.01.22.
//

import UIKit

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch [indexPath.section, indexPath.row] {
        case [1, 1]:
            navigationController?.pushViewController(WiFiSettingsViewController(), animated: true)
        case [1, 2]:
            navigationController?.pushViewController(BluetothSettingsViewController(), animated: true)
        default:
            print("Нажата клавиша \(settingModel[indexPath.section].options[indexPath.row].title)")
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
