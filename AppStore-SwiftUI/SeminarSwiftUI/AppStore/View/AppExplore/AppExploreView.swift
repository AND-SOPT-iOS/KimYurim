//
//  AppExploreView.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 12/13/24.
//

import SwiftUI

struct AppExploreView: View {
    @StateObject private var viewModel = AppExploreViewModel()
    
    var body: some View {
        BannerHStack(bannerApps: viewModel.bannerApps)
    }
}

// MARK: - Components
struct BannerHStack: View {
    let bannerApps: [AppData]
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(bannerApps, id: \.id) { app in
                    ZStack(alignment: .bottom) {
                        app.bannerImage
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .background(Color.gray)
                        
                        BannerTitleView(app: app)
                    }
                    .frame(width: width - 20, height: width / 2)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
    }
}

struct BannerTitleView: View {
    let app: AppData
    
    var body: some View {
        HStack(spacing: 16) {
            iconImage
            titleVStack
            Spacer()
            DownloadButton(state: app.downloadState, buttonColor: .gray) { }
        }
        .padding(20)
        .frame(maxWidth: .infinity)
    }
    
    // components
    var iconImage: some View {
        app.iconImage
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .frame(width: 50, height: 50)
    }
    
    var titleVStack: some View {
        VStack(alignment: .leading) {
            Text(app.title)
                .font(Font.system(size: 17, weight: .semibold))
            Text(app.subtitle)
                .font(Font.system(size: 15, weight: .regular))
        }
        .foregroundStyle(.white)
    }
}


#Preview {
    AppExploreView()
}
