//
//  ViewController.swift
//  HM12
//
//  Created by Александр Петрович on 15.12.2021.
//

import UIKit

let idCell = "TableViewSell"
var switchPosition = false
//var defaultDetailData = [0: ["Apple ID, iCloud, контент и покупки"],
//                         1: ["", "Вкл.", "Выкл.", "", "", "Не подключено"]]

class ViewController: UIViewController {
    
    //    var data = [0: ["Александр Петрович"],
    //                1: ["Авиарежим", "Wi-Fi", "Bluetooth", "Сотовая связь", "Режим модема", "VPN"],
    //                2: ["Уведомления", "Звуки, тактильные сигналы", "Фокусирование", "Экранное время"],
    //                3: ["Основные", "Пункт управления", "Экран и яркость", "Экран 'Домой'"]]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.backgroundColor = .systemGray6
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemGray6
        viewHierarchy()
        setupLayout()
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        self.navigationItem.searchController = search
        if settingModel[1].options[2].detailTextLabel == "Вкл." {
            bluetoothSettingsData = bluetoothOnSettingsData
        }
        if settingModel[1].options[1].detailTextLabel == "Вкл." {
            wiFiSettingsData = wiFiOnSettingsData
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    private func viewHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

class TableViewSell: UITableViewCell {
    override var reuseIdentifier: String? {
        return idCell
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingModel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingModel[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        var cell = tableView.dequeueReusableCell(withIdentifier: idCell)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: idCell)
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

        
        //        if indexPath.section == 0 {
        //            cell = UITableViewCell(style: .subtitle, reuseIdentifier: idCell)
        //            cell?.accessoryType = .disclosureIndicator
        //        } else {
        //            if indexPath.section == 1 && indexPath.row == 0 {
        //                cell = UITableViewCell(style: .default, reuseIdentifier: idCell)
        //                let aviaModeSwitch = UISwitch()
        //                aviaModeSwitch.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
        //                aviaModeSwitch.setOn(false, animated: true)
        //                cell!.accessoryView = aviaModeSwitch
        //                cell?.selectionStyle = .none
        //            } else {
        //                if indexPath.section == 1 && (indexPath.row != 0) {
        //                    cell = UITableViewCell(style: .value1, reuseIdentifier: idCell)
        //                    cell?.accessoryType = .disclosureIndicator
        //                } else {
        //                    cell?.accessoryType = .disclosureIndicator
        //                    cell?.accessoryView = .none
        //                }
        //            }
        //        }
        
        //        let image = settingModel[indexPath.section].options[indexPath.row].icon
        //        let image = self.[indexPath.section]?[indexPath.row]
        
        
        
        //        cell?.textLabel?.text = self.data[indexPath.section]?[indexPath.row]
        
        //        cell?.detailTextLabel?.text = defaultDetailData[indexPath.section]?[indexPath.row]
        return cell!
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

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text ?? "")
    }
}
