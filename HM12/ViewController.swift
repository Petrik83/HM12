//
//  ViewController.swift
//  HM12
//
//  Created by Александр Петрович on 15.12.2021.
//

import UIKit
let idCell = "TableViewSell"
class ViewController: UIViewController {
    
    
    var data = [0: ["Александр Петрович"],
                1: ["Авиарежим", "Wi-Fi", "Bluetooth", "Сотовая связь", "Режим модема", "VPN"],
                2: ["Уведомления", "Звуки, тактильные сигналы", "Фокусирование", "экранное время"],
                3: ["Основные", "Пункт управления", "Экран и яркость", "Экран 'Домой'"]]
    
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

    class TableViewSell: UITableViewCell {
        override var reuseIdentifier: String? {
            return idCell
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
        func numberOfSections(in tableView: UITableView) -> Int {
            return data.count
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data[section]?.count ?? 0
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            var cell = tableView.dequeueReusableCell(withIdentifier: idCell)
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: idCell)
            }

            cell?.textLabel?.text = self.data[indexPath.section]?[indexPath.row]
            
         
            return cell!
            
        }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text ?? "")
    }
    
    
}
