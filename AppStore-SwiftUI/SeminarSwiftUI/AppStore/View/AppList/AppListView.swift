//
//  AppListView.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 11/23/24.
//

import SwiftUI

struct AppListView: View {
    var body: some View {
        
        List(sampleApps) { app in
            AppCell(app: app)
        }
    }
}

#Preview {
    AppListView()
}
