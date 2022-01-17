//
//  WiFiSettingsViewControllerDelegat.swift
//  HM12
//
//  Created by Aliaksandr Piatrovich on 17.01.22.
//

import UIKit

extension WiFiSettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch [indexPath.section, indexPath.row] {
        case [0, 0]:
            break
        default:
            let temp = WiFiSettingsViewController.wiFiSettingsData[indexPath.section].options[indexPath.row]
            
            guard WiFiSettingsViewController.wiFiSettingsData[safe: 0]?.options.count != nil else { break }
            guard settingModel[safe: 1]?.options[safe: 1]?.detailTextLabel != nil else { break }
            guard WiFiSettingsViewController.wiFiSettingsData[safe: 1]?.options != nil else { break }
            
            if WiFiSettingsViewController.wiFiSettingsData[0].options.count == 1 {
                WiFiSettingsViewController.wiFiSettingsData[indexPath.section].options.remove(at: indexPath.row)
                WiFiSettingsViewController.wiFiSettingsData[0].options.append(temp)
                settingModel[1].options[1].detailTextLabel = temp.title
                wiFitableView.reloadData()
            } else {
                if indexPath.section != 0 {
                    let temp1 = WiFiSettingsViewController.wiFiSettingsData[0].options[1]
                    WiFiSettingsViewController.wiFiSettingsData[1].options.append(temp1)
                    WiFiSettingsViewController.wiFiSettingsData[0].options.remove(at: 1)
                    WiFiSettingsViewController.wiFiSettingsData[indexPath.section].options.remove(at: indexPath.row)
                    WiFiSettingsViewController.wiFiSettingsData[0].options.append(temp)
                    wiFitableView.reloadData()
                    settingModel[1].options[1].detailTextLabel = temp.title
                }
            }
            
            
        }
    }
}
