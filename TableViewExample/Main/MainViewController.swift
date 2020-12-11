//
//  MainViewController.swift
//  voi-app
//
//  Created by David Jangdal on 2020-11-18.
//  Copyright © 2018 Voi Technology. All rights reserved.
//

import Voiper
import UIKit

final class MainViewController: ViewController {
    typealias PresenterType = MainPresenterProtocol
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        addTableView()
    }
    
    func configureTableView() {
        tableView.register(HeaderCell.self, forCellReuseIdentifier: HeaderDataSource.cellIdentifier)
        tableView.register(ScrollableCell.self, forCellReuseIdentifier: ScrollableCellDataSource.cellIdentifier)
        tableView.register(FooterCell.self, forCellReuseIdentifier: FooterDataSource.cellIdentifier)
        tableView.register(TitleCell.self, forCellReuseIdentifier: TitleDataSource.cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
    }
    
    func addTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
}

extension MainViewController: MainViewControllerProtocol {
    func reloadUI() {
        tableView.reloadData()
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataSource = presenter.dataSource(for: indexPath.row)
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: dataSource.cellIdentifier) as? TableCell {
            cell.configure(dataSource)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if presenter.dataSource(for: indexPath.row) is ScrollableCellDataSource {
            return 300
        }
        return UITableView.automaticDimension
    }
}

extension MainViewController: UITableViewDelegate {
}
