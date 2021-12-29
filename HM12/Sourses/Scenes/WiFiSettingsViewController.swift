//
//  WiFiSettingsViewController.swift
//  dcd
//
//  Created by Александр Петрович on 14.12.2021.
//

import UIKit
var wiFiSettingsData = Section.getWiFiData()
let wiFiOnSettingsData = Section.getWiFiOnData()

class WiFiSettingsViewController: UIViewController {
    let wiFiSwitch = UISwitch()
    
    lazy var wiFitableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.backgroundColor = .systemGray6
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        title = "Wi-Fi"
        view.backgroundColor = .systemGray6
        viewHierarchy()
        setupLayout()
//        if settingModel[1].options[1].detailTextLabel == "Вкл." {
//            wiFiSettingsData = wiFiOnSettingsData
//        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func viewHierarchy() {
        view.addSubview(wiFitableView)
    }
    
    private func setupLayout() {
        wiFitableView.translatesAutoresizingMaskIntoConstraints = false
        wiFitableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        wiFitableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        wiFitableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        wiFitableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension WiFiSettingsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return wiFiSettingsData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wiFiSettingsData[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = setCellStyle(style: wiFiSettingsData[indexPath.section].options[indexPath.row].style)
        //UITableViewCell(style: .default, reuseIdentifier: idCell)
        
        switch wiFiSettingsData[indexPath.section].options[indexPath.row].type {
        case .none:
            cell.accessoryType = .none
        case .disclosureIndicator:
            cell.accessoryType = .disclosureIndicator
        case .switchCell:
            let wiFiSwitch = UISwitch()
            wiFiSwitch.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
            
            if settingModel[1].options[1].detailTextLabel == "Выкл." {
                wiFiSwitch.setOn(false, animated: true)
            } else {
                wiFiSwitch.setOn(true, animated: true)
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
        
        
        
        
        //        if indexPath.section == 0 && indexPath.row == 0 {
        //            wiFiSwitch.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
        //            if settingModel[1].options[1].detailTextLabel == "Выкл." {
        //                wiFiSwitch.setOn(false, animated: true)
        //            } else {
        //                wiFiSwitch.setOn(true, animated: true)
        //            }
        //            cell.accessoryView = wiFiSwitch
        //            cell.selectionStyle = .none
        //        } else {
        //            if indexPath.section == 0 && indexPath.row == 1 {
        //                cell.imageView?.image = UIImage(named: "check")
        //                cell.accessoryType = .detailButton
        //            } else {
        //                cell.accessoryType = .detailButton
        //            }
        //        }
        
        cell.textLabel?.text = wiFiSettingsData[indexPath.section].options[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section != 0 {
            return wiFiSettingsData[section].title
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch [indexPath.section, indexPath.row] {
        case [0, 0]:
            break
        default:
            let temp = wiFiSettingsData[indexPath.section].options[indexPath.row]
            if wiFiSettingsData[0].options.count == 1 {
                wiFiSettingsData[indexPath.section].options.remove(at: indexPath.row)
                wiFiSettingsData[0].options.append(temp)
                settingModel[1].options[1].detailTextLabel = temp.title
                wiFitableView.reloadData()
            } else {
                if indexPath.section != 0 {
                    let temp1 = wiFiSettingsData[0].options[1]
                    wiFiSettingsData[1].options.append(temp1)
                    wiFiSettingsData[0].options.remove(at: 1)
                    wiFiSettingsData[indexPath.section].options.remove(at: indexPath.row)
                    wiFiSettingsData[0].options.append(temp)
                    wiFitableView.reloadData()
                    settingModel[1].options[1].detailTextLabel = temp.title
                }
            }
        }
    }
    
    @objc func switchChanged(_ sender : UISwitch!) {
        
        if !sender.isOn {
            wiFiSettingsData = Section.getWiFiData()
            settingModel[1].options[1].detailTextLabel = "Выкл."
            wiFiSwitch.setOn(false, animated: true)
            wiFitableView.reloadData()
        } else {
            wiFiSettingsData = wiFiOnSettingsData
            settingModel[1].options[1].detailTextLabel = "Вкл."
            wiFitableView.reloadData()
            wiFiSwitch.setOn(true, animated: true)
        }
    }
}
