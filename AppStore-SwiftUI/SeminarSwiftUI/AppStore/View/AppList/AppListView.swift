//
//  AppListView.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 11/23/24.
//

import SwiftUI

struct AppListView: View {
    var body: some View {
        
        NavigationView {
            List(sampleApps) { app in
                NavigationLink(destination: AppDetailView(app: app)) {
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
