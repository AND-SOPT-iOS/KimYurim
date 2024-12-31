//
//  CategoryExploreViewModel.swift
//  35-seminar
//
//  Created by 김유림 on 12/31/24.
//

import Foundation

class CategoryExploreViewModel {
    
    // MARK: - Properties
    var bannerApps: [App] = []
    var essentialApps: [App] = []
    var paidApps: [App] = []
    var freeApps: [App] = []
    
    
    // MARK: - Methods
    init() {
        setListApps()
        setBannerApps()
    }
    
    func setListApps() {
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
    
    func setBannerApps() {
        bannerApps = Array(App.sampleApps[0..<4])
    }
}
