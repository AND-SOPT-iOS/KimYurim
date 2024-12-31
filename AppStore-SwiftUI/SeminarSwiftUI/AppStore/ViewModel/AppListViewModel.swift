//
//  AppListViewModel.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 12/13/24.
//

import Foundation

class AppListViewModel: ObservableObject {
    let apps: [AppData]
    let title: String
    
    init(apps: [AppData], title: String) {
        self.apps = apps
        self.title = title
    }
}
