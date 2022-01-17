//
//  BluetothSettingsViewControllerDataSource.swift
//  HM12
//
//  Created by Aliaksandr Piatrovich on 17.01.22.
//

import UIKit

extension BluetothSettingsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return BluetothSettingsViewController.bluetoothSettingsData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BluetothSettingsViewController.bluetoothSettingsData[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = setCellStyle(style: BluetothSettingsViewController.bluetoothSettingsData[indexPath.section].options[indexPath.row].style)
        
        switch BluetothSettingsViewController.bluetoothSettingsData[indexPath.section].options[indexPath.row].type {
        case .none:
            cell.accessoryType = .none
        case .disclosureIndicator:
            cell.accessoryType = .disclosureIndicator
        case .switchCell:
            bluetoothSwitch.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
            if settingModel[1].options[2].detailTextLabel == "Выкл." {
                bluetoothSwitch.setOn(false, animated: true)
            } else {
                bluetoothSwitch.setOn(true, animated: true)
            }
            cell.accessoryView = bluetoothSwitch
            cell.selectionStyle = .none
        case .detailButton:
            cell.accessoryType = .detailButton
        }
        
        cell.textLabel?.text = BluetothSettingsViewController.bluetoothSettingsData[indexPath.section].options[indexPath.row].title
        cell.detailTextLabel?.text = BluetothSettingsViewController.bluetoothSettingsData[indexPath.section].options[indexPath.row].detailTextLabel
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section != 0 {
            return BluetothSettingsViewController.bluetoothSettingsData[section].title
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 && bluetoothSwitch.isOn {
            return "Имя при обнаружении \"iPhone 12\""
        } else {
            if section == 0 && !bluetoothSwitch.isOn {
                return "AirDrop, AirPlay, локатор, службы геолокации и разблокировка с apple Watch используют Bluetooth"
            }
        }
        return nil
    }
    
    @objc func switchChanged(_ sender : UISwitch!) {
        if sender.isOn {
            BluetothSettingsViewController.bluetoothSettingsData = Section.getBluetoothOnData()
            settingModel[1].options[2].detailTextLabel = "Вкл."
            bluetoothSwitch.setOn(true, animated: true)
            bluetoothTableView.reloadData()
        } else {
            BluetothSettingsViewController.bluetoothSettingsData = Section.getBluetoothOffData()
            settingModel[1].options[2].detailTextLabel = "Выкл."
            bluetoothSwitch.setOn(false, animated: true)
            bluetoothTableView.reloadData()
        }
    }
}
