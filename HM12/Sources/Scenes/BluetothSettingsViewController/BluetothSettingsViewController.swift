//
//  BluetothSettingsViewController.swift
//  HM12
//
//  Created by Александр Петрович on 15.12.2021.
//

import UIKit



class BluetothSettingsViewController: UIViewController {
    
    static var bluetoothSettingsData = Section.getBluetoothOffData()
    static var bluetoothOnSettingsData = Section.getBluetoothOnData()
    
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




