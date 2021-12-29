//
//  BluetothSettingsViewController.swift
//  HM12
//
//  Created by Александр Петрович on 15.12.2021.
//

import UIKit

var bluetoothSettingsData = Section.getBluetoothOffData()
//[0: ["Bluetooth"]]

var bluetoothOnSettingsData = Section.getBluetoothOnData()
//[0: ["Bluetooth"],
//                               1: ["Apple whatch", "Airpods"]]

//let bluetoothOffSettingsSubTitleData = [0: [""],
//                                        1: ["Не подключено", "Не подключено"]]
//
//var bluetoothSettingsSubTitleData = bluetoothOffSettingsSubTitleData

class BluetothSettingsViewController: UIViewController {
    
    let bluetoothSwitch = UISwitch()
    
    lazy var bluetoothTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.backgroundColor = .systemGray6
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        title = "Bluetooth"
        view.backgroundColor = .systemGray6
        viewHierarchy()
        setupLayout()
//        print(bluetoothSettingsData)

//        if settingModel[1].options[2].detailTextLabel == "Вкл." {
//            bluetoothSettingsData = bluetoothOnSettingsData
//        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func viewHierarchy() {
        view.addSubview(bluetoothTableView)
    }
    
    private func setupLayout() {
        bluetoothTableView.translatesAutoresizingMaskIntoConstraints = false
        bluetoothTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        bluetoothTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bluetoothTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bluetoothTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension BluetothSettingsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return bluetoothSettingsData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bluetoothSettingsData[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = setCellStyle(style: bluetoothSettingsData[indexPath.section].options[indexPath.row].style)
        //        UITableViewCell(style: .value1, reuseIdentifier: idCell)
        
        switch bluetoothSettingsData[indexPath.section].options[indexPath.row].type {
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
        
        //        if indexPath.section == 0 && indexPath.row == 0 {
        //            bluetoothSwitch.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
        //            if settingModel[1].options[2].detailTextLabel == "Выкл." {
        //                bluetoothSwitch.setOn(false, animated: true)
        //            } else {
        //                bluetoothSwitch.setOn(true, animated: true)
        //            }
        //            cell.accessoryView = bluetoothSwitch
        //            cell.selectionStyle = .none
        //        } else {
        //            cell.accessoryType = .detailButton
        //        }
        
        cell.textLabel?.text = bluetoothSettingsData[indexPath.section].options[indexPath.row].title
        cell.detailTextLabel?.text = bluetoothSettingsData[indexPath.section].options[indexPath.row].detailTextLabel
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section != 0 {
            return bluetoothSettingsData[section].title
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch [indexPath.section, indexPath.row] {
        case [0, 0]:
            break
        default:
            bluetoothSettingsData[indexPath.section].options[indexPath.row].detailTextLabel = "Подключено"
            bluetoothOnSettingsData[indexPath.section].options[indexPath.row].detailTextLabel = "Подключено"
            bluetoothTableView.reloadData()
        }
    }
    
    @objc func switchChanged(_ sender : UISwitch!) {
        if !sender.isOn {
            bluetoothSettingsData = Section.getBluetoothOffData()
            settingModel[1].options[2].detailTextLabel = "Выкл."
            bluetoothSwitch.setOn(false, animated: true)
            bluetoothTableView.reloadData()
        } else {
            bluetoothSettingsData = Section.getBluetoothOnData()
            settingModel[1].options[2].detailTextLabel = "Вкл."
            bluetoothSwitch.setOn(true, animated: true)
            bluetoothTableView.reloadData()
        }
    }
}
