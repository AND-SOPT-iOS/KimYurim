//
//  AppExploreViewModel.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 12/13/24.
//

import Foundation

class AppExploreViewModel: ObservableObject {
    @Published var apps: [AppData]
    @Published var bannerApps: [AppData] = []
    @Published var essentialApps: [AppData] = []
    @Published var freeApps: [AppData] = []
    @Published var paidApps: [AppData] = []

    init(apps: [AppData] = sampleApps) {
        self.apps = apps
        
        setBannerApps()
        setListApps()
    }
    
    private func setBannerApps() {
        bannerApps = Array(apps[..<4])
    }
    
    private func setListApps() {
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
}
