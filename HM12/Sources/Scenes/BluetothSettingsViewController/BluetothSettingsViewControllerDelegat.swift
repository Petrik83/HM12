//
//  BluetothSettingsViewControllerDelegat.swift
//  HM12
//
//  Created by Aliaksandr Piatrovich on 17.01.22.
//

import UIKit

extension BluetothSettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch [indexPath.section, indexPath.row] {
        case [0, 0]:
            break
        default:
            BluetothSettingsViewController.bluetoothSettingsData[indexPath.section].options[indexPath.row].detailTextLabel = "Подключено"
            BluetothSettingsViewController.bluetoothOnSettingsData[indexPath.section].options[indexPath.row].detailTextLabel = "Подключено"
            bluetoothTableView.reloadData()
        }
    }
}
