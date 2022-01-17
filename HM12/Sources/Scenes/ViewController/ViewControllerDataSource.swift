//
//  ViewControllerDataSource.swift
//  HM12
//
//  Created by Aliaksandr Piatrovich on 17.01.22.
//

import UIKit

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingModel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingModel[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        var cell = tableView.dequeueReusableCell(withIdentifier: ViewController.idCell)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: ViewController.idCell)
        }
        
        cell = setCellStyle(style: settingModel[indexPath.section].options[indexPath.row].style)
        
        switch settingModel[indexPath.section].options[indexPath.row].type {
        case .none:
            cell?.accessoryType = .none
        case .disclosureIndicator:
            cell?.accessoryType = .disclosureIndicator
        case .switchCell:
            let AirmodeSwitch = UISwitch()
            AirmodeSwitch.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
            AirmodeSwitch.setOn(switchPosition, animated: true)
            cell?.accessoryView = AirmodeSwitch
            cell?.selectionStyle = .none
        case .detailButton:
            cell?.accessoryType = .detailButton
        }
        
        cell?.imageView?.image = settingModel[indexPath.section].options[indexPath.row].icon
        cell?.textLabel?.text = settingModel[indexPath.section].options[indexPath.row].title
        cell?.detailTextLabel?.text = settingModel[indexPath.section].options[indexPath.row].detailTextLabel
        return cell ?? UITableViewCell()
    }
    
    @objc func switchChanged(_ sender : UISwitch!){
        
        if sender.isOn {
            tableView.cellForRow(at: IndexPath(row: 1, section: 1))?.detailTextLabel?.text = "Выкл."
            tableView.cellForRow(at: IndexPath(row: 2, section: 1))?.detailTextLabel?.text = "Выкл."
            tableView.cellForRow(at: IndexPath(row: 3, section: 1))?.detailTextLabel?.text = "Авиарежим"
            tableView.cellForRow(at: IndexPath(row: 4, section: 1))?.detailTextLabel?.text = "Выкл."
            tableView.cellForRow(at: IndexPath(row: 5, section: 1))?.detailTextLabel?.text = "Не подключено"
            switchPosition = true
        } else {
            tableView.cellForRow(at: IndexPath(row: 1, section: 1))?.detailTextLabel?.text = settingModel[1].options[1].detailTextLabel
            tableView.cellForRow(at: IndexPath(row: 2, section: 1))?.detailTextLabel?.text = settingModel[1].options[2].detailTextLabel
            tableView.cellForRow(at: IndexPath(row: 3, section: 1))?.detailTextLabel?.text = settingModel[1].options[3].detailTextLabel
            tableView.cellForRow(at: IndexPath(row: 4, section: 1))?.detailTextLabel?.text = settingModel[1].options[4].detailTextLabel
            tableView.cellForRow(at: IndexPath(row: 5, section: 1))?.detailTextLabel?.text =  settingModel[1].options[5].detailTextLabel
            switchPosition = false
        }
    }
}



