//
//  ChartViewController.swift
//  35-seminar
//
//  Created by 김유림 on 10/26/24.
//

import UIKit

class ChartViewController: UIViewController {
    
    // MARK: - Properties
    let chartView = ChartView()
    let appData = App.sampleApps
    
    // MARK: - Methods
    
    override func loadView() {
        view = chartView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }
    
    private func setTableView() {
        chartView.tableView.dataSource = self
        chartView.tableView.delegate = self
        chartView.tableView.register(ChartTableViewCell.self, forCellReuseIdentifier: ChartTableViewCell.identifier)
    }
}

extension ChartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = chartView.tableView.dequeueReusableCell(
            withIdentifier: ChartTableViewCell.identifier,
            for: indexPath
        ) as? ChartTableViewCell else { return UITableViewCell() }
        cell.bind(appData: appData[indexPath.row])
        return cell
    }
}

extension ChartViewController: UITableViewDelegate {
    
}
