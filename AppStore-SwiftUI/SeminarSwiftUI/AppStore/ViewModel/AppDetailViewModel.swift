//
//  AppDetailViewModel.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 12/13/24.
//

import Foundation

class AppDetailViewModel: ObservableObject {
    let app: AppData

    init(app: AppData) {
        self.app = app
    }
}
