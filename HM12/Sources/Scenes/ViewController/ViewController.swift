//
//  ViewController.swift
//  HM12
//
//  Created by Александр Петрович on 15.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    static let idCell = "TableViewSell"
    var switchPosition = false
    
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
        
        
        if let bluetoothSwitch = settingModel[safe: 1]?.options[safe: 2]?.detailTextLabel {
            if bluetoothSwitch == "Вкл." {
                BluetothSettingsViewController.bluetoothSettingsData = BluetothSettingsViewController.bluetoothOnSettingsData
            }
        }
        
        if let wiFiSwitch = settingModel[safe: 1]?.options[safe: 1]?.detailTextLabel {
            if wiFiSwitch  == "Вкл." {
                WiFiSettingsViewController.wiFiSettingsData = WiFiSettingsViewController.wiFiOnSettingsData
            }
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

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text ?? "")
    }
}
