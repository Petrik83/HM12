//
//  WiFiSettingsViewControllerDataSource.swift
//  HM12
//
//  Created by Aliaksandr Piatrovich on 17.01.22.
//

import UIKit

extension WiFiSettingsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return WiFiSettingsViewController.wiFiSettingsData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WiFiSettingsViewController.wiFiSettingsData[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = setCellStyle(style: WiFiSettingsViewController.wiFiSettingsData[indexPath.section].options[indexPath.row].style)
        
        switch WiFiSettingsViewController.wiFiSettingsData[indexPath.section].options[indexPath.row].type {
        case .none:
            cell.accessoryType = .none
        case .disclosureIndicator:
            cell.accessoryType = .disclosureIndicator
        case .switchCell:
            let wiFiSwitch = UISwitch()
            wiFiSwitch.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
            
            if let wiFiSwitchPosition = settingModel[1].options[1].detailTextLabel {
                if wiFiSwitchPosition == "Выкл." {
                    wiFiSwitch.setOn(false, animated: true)
                } else {
                    wiFiSwitch.setOn(true, animated: true)
                }
            }
            
            cell.accessoryView = wiFiSwitch
            cell.selectionStyle = .none
        case .detailButton:
            cell.accessoryType = .detailButton
        }
        
        if indexPath.section == 0 && indexPath.row == 1 {
            cell.imageView?.image = UIImage(named: "check")
            cell.accessoryType = .detailButton
        }
        
        cell.textLabel?.text = WiFiSettingsViewController.wiFiSettingsData[indexPath.section].options[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section != 0 {
            return WiFiSettingsViewController.wiFiSettingsData[section].title
        }
        return nil
    }
    
    @objc func switchChanged(_ sender : UISwitch!) {
        
        if sender.isOn {
            WiFiSettingsViewController.wiFiSettingsData = WiFiSettingsViewController.wiFiOnSettingsData
            if settingModel[safe: 1]?.options[safe: 1]?.detailTextLabel != nil {
                settingModel[1].options[1].detailTextLabel = "Вкл."
            }
            wiFitableView.reloadData()
            wiFiSwitch.setOn(true, animated: true)
        } else {
            WiFiSettingsViewController.wiFiSettingsData = Section.getWiFiData()
            if settingModel[safe: 1]?.options[safe: 1]?.detailTextLabel != nil {
                settingModel[1].options[1].detailTextLabel = "Выкл."
            }
            wiFiSwitch.setOn(false, animated: true)
            wiFitableView.reloadData()
        }
    }
}
