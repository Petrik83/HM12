//
//  BluetothSettingsViewController.swift
//  HM12
//
//  Created by Александр Петрович on 15.12.2021.
//

import UIKit
var bluetoothSettingsData = [0: ["Bluetooth"]]
let bluetoothOnSettingsData = [0: ["Bluetooth"],
                    1: ["Apple whatch", "Airpods"]]
var bluetoothSettingsSubTitleData = [0: [""],
                                     1: ["Не подключено", "Не подключено"]]
let bluetoothOffSettingsSubTitleData = bluetoothSettingsSubTitleData
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
        if defaultDetailData[1]?[2] == "Вкл." {
            bluetoothSettingsData = bluetoothOnSettingsData
        }
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
        return bluetoothSettingsData[section]?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: idCell)
        
        if indexPath.section == 0 && indexPath.row == 0 {
            
            bluetoothSwitch.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
            if defaultDetailData[1]?[2] == "Выкл." {
                bluetoothSwitch.setOn(false, animated: true)
            } else {
                bluetoothSwitch.setOn(true, animated: true)
            }
            cell.accessoryView = bluetoothSwitch
            cell.selectionStyle = .none
        } else {
            
                cell.accessoryType = .detailButton
       
        }
        
        cell.textLabel?.text = bluetoothSettingsData[indexPath.section]?[indexPath.row]
        cell.detailTextLabel?.text = bluetoothSettingsSubTitleData[indexPath.section]?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch [indexPath.section, indexPath.row] {
        case [0, 0]:
            break
        default:
            bluetoothSettingsSubTitleData[indexPath.section]?[indexPath.row] = "Подключено"
            bluetoothTableView.reloadData()
            
        }
    }
    
    @objc func switchChanged(_ sender : UISwitch!){
        if !sender.isOn {
            bluetoothSettingsData = [0: ["Bluetooth"]]
            defaultDetailData[1]?[2] = "Выкл."
            bluetoothSwitch.setOn(false, animated: true)
            bluetoothSettingsSubTitleData = bluetoothOffSettingsSubTitleData
            bluetoothTableView.reloadData()

        } else {
            
            bluetoothSettingsData = bluetoothOnSettingsData
            defaultDetailData[1]?[2] = "Вкл."
            bluetoothSwitch.setOn(true, animated: true)
            bluetoothTableView.reloadData()
        }
    }
}
