//
//  CategoryExploreViewController.swift
//  35-seminar
//
//  Created by 김유림 on 10/30/24.
//

import UIKit

class CategoryExploreViewController: BaseViewController {
    // MARK: - Properties
    private var bannerApps: [App] = []
    private var essentialApps: [App] = []
    private var paidApps: [App] = []
    private var freeApps: [App] = []
    
    // MARK: - Methods
    private let categoryExploreView = CategoryExploreView()
    
    override func loadView() {
        view = categoryExploreView
    }
    
    override func viewDidLoad() {
        setListApps()
        setBannerApps()
        
        super.viewDidLoad()
    }
    
    override func setDelegate() {
        categoryExploreView.tableView.dataSource = self
        categoryExploreView.tableView.delegate = self
        categoryExploreView.tableView.register(ExploreListTableViewCell.self, forCellReuseIdentifier: ExploreListTableViewCell.identifier)
        categoryExploreView.tableView.register(ExploreBannerTableViewCell.self, forCellReuseIdentifier: ExploreBannerTableViewCell.identifier)
        categoryExploreView.tableView.register(ExploreTableViewHeader.self, forHeaderFooterViewReuseIdentifier: ExploreTableViewHeader.identifier)
    }
    
    private func setListApps() {
        let apps = App.sampleApps
        
        var essentialAppsCount = 0
        var paidAppsCount = 0
        var freeAppsCount = 0
        
        for app in apps {
            if app.price == 0 {
                guard freeAppsCount < 15 else { continue }
                freeApps.append(app)
                freeAppsCount += 1
            } else {
                guard paidAppsCount < 15 else { continue }
                paidApps.append(app)
                paidAppsCount += 1
            }
            
            if essentialAppsCount > 15,
               paidAppsCount >= 15,
               freeAppsCount >= 15 { break }
            
            guard essentialAppsCount < 15 else { continue }
            essentialApps.append(app)
            essentialAppsCount += 1
        }
    }
    
    private func setBannerApps() {
        bannerApps = Array(App.sampleApps[0..<4])
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
        
        switch indexPath.section {
            // banner apps
        case 0:
            guard let cell = categoryExploreView.tableView.dequeueReusableCell(
                withIdentifier: ExploreBannerTableViewCell.identifier,
                for: indexPath
            ) as? ExploreBannerTableViewCell else { return UITableViewCell() }
            
            cell.bind(apps: bannerApps)
            return cell
            
            // list apps
        default:
            guard let cell = categoryExploreView.tableView.dequeueReusableCell(
                withIdentifier: ExploreListTableViewCell.identifier,
                for: indexPath
            ) as? ExploreListTableViewCell else { return UITableViewCell() }
            
            switch indexPath.section {
            case 1:
                cell.bind(apps: essentialApps)
            case 2:
                cell.bind(apps: paidApps)
            default:
                cell.bind(apps: freeApps)
            }
            
            return cell
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
        let header = ExploreTableViewHeader()
        switch section {
        case 0:
            return UIView()
        case 1:
            header.bind(section: .essential)
        case 2:
            header.bind(section: .paid)
        case 3:
            header.bind(section: .free)
        default:
            return UIView()
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 70
        case 1:
            return 70
        default:
            return 44
        }
    }
    
    
}
