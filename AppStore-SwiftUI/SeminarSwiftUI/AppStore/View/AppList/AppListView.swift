//
//  AppListView.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 11/23/24.
//

import SwiftUI

struct AppListView: View {
    private let viewModel = AppListViewModel()
    
    var body: some View {
        
        NavigationView {
            List(sampleApps) { app in
                NavigationLink(destination: AppDetailView(viewModel: AppDetailViewModel(app: app))) {
                    AppCell(app: app)
                }
            }
            .navigationTitle("앱")
        }
    }
}

#Preview {
    AppListView()
}
