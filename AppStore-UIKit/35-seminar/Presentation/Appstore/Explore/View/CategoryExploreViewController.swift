//
//  CategoryExploreViewController.swift
//  35-seminar
//
//  Created by 김유림 on 10/30/24.
//

import UIKit

final class CategoryExploreViewController: BaseViewController {
    
    // MARK: - Properties
    
    private let categoryExploreView = CategoryExploreView()
    private let viewModel = CategoryExploreViewModel()
    
    
    // MARK: - Methods
    
    override func loadView() {
        view = categoryExploreView
    }
    
    override func setDelegate() {
        categoryExploreView.tableView.dataSource = self
        categoryExploreView.tableView.delegate = self
        
        categoryExploreView.tableView.register(ExploreListTableViewCell.self, forCellReuseIdentifier: ExploreListTableViewCell.identifier)
        categoryExploreView.tableView.register(ExploreBannerTableViewCell.self, forCellReuseIdentifier: ExploreBannerTableViewCell.identifier)
        categoryExploreView.tableView.register(ExploreListTableViewHeader.self, forHeaderFooterViewReuseIdentifier: ExploreListTableViewHeader.identifier)
    }
}

extension CategoryExploreViewController: UITableViewDataSource {
    // section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    // cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let bannerCell = categoryExploreView.tableView.dequeueReusableCell(
            withIdentifier: ExploreBannerTableViewCell.identifier,
            for: indexPath
        ) as? ExploreBannerTableViewCell
        
        let listCell = categoryExploreView.tableView.dequeueReusableCell(
            withIdentifier: ExploreListTableViewCell.identifier,
            for: indexPath
        ) as? ExploreListTableViewCell
        
        
        switch indexPath.section {
            
            // banner apps
        case 0:
            guard let cell = bannerCell else { return UITableViewCell() }
            cell.bind(apps: viewModel.bannerApps)
            return cell
            
            // list apps
        case 1:
            guard let cell = listCell else { return UITableViewCell() }
            cell.bind(apps: viewModel.essentialApps, exploreVC: self)
            return cell
            
        case 2:
            guard let cell = listCell else { return UITableViewCell() }
            cell.bind(apps: viewModel.paidApps, exploreVC: self)
            return cell
            
        case 3:
            guard let cell = listCell else { return UITableViewCell() }
            cell.bind(apps: viewModel.freeApps, exploreVC: self)
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}


extension CategoryExploreViewController: UITableViewDelegate {
    // cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return CGFloat(ExploreBannerCollectionViewCell.height)
            
        default :
            return CGFloat(ExploreListCollectionViewCell.height)
        }
    }
    
    // header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExploreListTableViewHeader()
        switch section {
        case 0:
            return UIView()
        case 1:
            header.bind(section: .essential)
        case 2:
            header.bind(section: .paid)
            header.allButton.addTarget(self, action: #selector(tappedAllButton), for: .touchUpInside)
        case 3:
            header.bind(section: .free)
            header.allButton.addTarget(self, action: #selector(tappedAllButton), for: .touchUpInside)
        default:
            return UIView()
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        case 1:
            return 70
        default:
            return 44
        }
    }
    
    @objc func tappedAllButton() {
        let chartVC = ChartViewController()
        self.navigationController?.pushViewController(chartVC, animated: true)
    }
}
