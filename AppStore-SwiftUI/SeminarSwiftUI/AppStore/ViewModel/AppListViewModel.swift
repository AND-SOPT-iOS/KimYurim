//
//  AppListViewModel.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 12/13/24.
//

import Foundation

class AppListViewModel: ObservableObject {
    let apps: [AppData] // 데이터가 정적이므로 @Published 생략함

    init(apps: [AppData] = sampleApps) {
        self.apps = apps
    }
}
