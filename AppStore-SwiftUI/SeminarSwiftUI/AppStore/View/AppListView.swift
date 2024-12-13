//
//  AppListView.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 11/23/24.
//

import SwiftUI

struct AppListView: View {
    let viewModel: AppListViewModel
    
    var body: some View {
        List(viewModel.apps) { app in
            NavigationLink(destination: AppDetailView(viewModel: AppDetailViewModel(app: app))) {
                AppCell(app: app)
            }
        }
        .navigationTitle(viewModel.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AppListView(viewModel: AppListViewModel(apps: sampleApps, title: "앱"))
}
