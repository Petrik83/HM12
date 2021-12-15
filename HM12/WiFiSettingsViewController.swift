//
//  WiFiSettingsViewController.swift
//  dcd
//
//  Created by Александр Петрович on 14.12.2021.
//

import UIKit
var wiFiSettingsData = [0: ["Wi-Fi"]]

class WiFiSettingsViewController: UIViewController {
    let wiFiSwitch = UISwitch()
    
    lazy var tableView1: UITableView = {
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
    }
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func viewHierarchy() {
        view.addSubview(tableView1)
    }
    
    private func setupLayout() {
        tableView1.translatesAutoresizingMaskIntoConstraints = false
        tableView1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension WiFiSettingsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return wiFiSettingsData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wiFiSettingsData[section]?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: idCell)
        
        if indexPath.section == 0 && indexPath.row == 0 {
            
            wiFiSwitch.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
            if defaultDetailData[1]?[1] == "Выкл." {
                wiFiSwitch.setOn(false, animated: true)
            } else {
                wiFiSwitch.setOn(true, animated: true)
            }
            cell.accessoryView = wiFiSwitch
            cell.selectionStyle = .none
        } else {
            if indexPath.section == 0 && indexPath.row == 1 {
                cell.imageView?.image = UIImage(named: "check")
                cell.accessoryType = .detailButton
            } else {
                cell.accessoryType = .detailButton
            }
        }
        
        cell.textLabel?.text = wiFiSettingsData[indexPath.section]?[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch [indexPath.section, indexPath.row] {
        case [0, 0]:
            break
        default:
            let temp = wiFiSettingsData[indexPath.section]?[indexPath.row]
            if wiFiSettingsData[0]?.count == 1 {
                wiFiSettingsData[indexPath.section]?.remove(at: indexPath.row)
                wiFiSettingsData[0]?.append(temp ?? "")
                defaultDetailData[1]?[1] = temp ?? ""
                tableView1.reloadData()
                
            } else {
                if indexPath.section != 0 {
                    let temp1 = wiFiSettingsData[0]?[1]
                    wiFiSettingsData[1]?.append(temp1 ?? "")
                    wiFiSettingsData[0]?.remove(at: 1)
                    wiFiSettingsData[indexPath.section]?.remove(at: indexPath.row)
                    wiFiSettingsData[0]?.append(temp ?? "")
                    tableView1.reloadData()
                    defaultDetailData[1]?[1] = temp ?? ""
                    
                }
            }
            
        }
    }
    
    @objc func switchChanged(_ sender : UISwitch!){
        if !sender.isOn {
            wiFiSettingsData = [0: ["Wi-Fi"]]
            defaultDetailData[1]?[1] = "Выкл."
            wiFiSwitch.setOn(false, animated: true)
            tableView1.reloadData()
        } else {
            
            wiFiSettingsData = [0: ["Wi-Fi"],
                                1: ["macWiFi", "avia8-1 net", "free Wi-Fi"]]
            defaultDetailData[1]?[1] = "Вкл."
            tableView1.reloadData()
            wiFiSwitch.setOn(true, animated: true)
        }
    }
}
