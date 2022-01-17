//
//  WiFiSettingsViewController.swift
//  dcd
//
//  Created by Александр Петрович on 14.12.2021.
//

import UIKit
//var wiFiSettingsData = Section.getWiFiData()
//let wiFiOnSettingsData = Section.getWiFiOnData()

class WiFiSettingsViewController: UIViewController {
    static var wiFiSettingsData = Section.getWiFiData()
    static let wiFiOnSettingsData = Section.getWiFiOnData()
    
    
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



