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
        NavigationView {
            ScrollView {
                VStack(spacing: 40) {
                    BannerHSlideView(bannerApps: viewModel.bannerApps)
                    
                    AppListHSlideView(sectionTitle: "필수 금융 앱", apps: viewModel.essentialApps)
                    
                    AppListHSlideView(sectionTitle: "유료 순위", apps: viewModel.paidApps)
                    
                    AppListHSlideView(sectionTitle: "무료 순위", apps: viewModel.freeApps)
                }
            }
            .padding(.horizontal, 20)
            .navigationTitle("금융")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


// MARK: - Components

struct BannerHSlideView: View {
    let bannerApps: [AppData]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(bannerApps, id: \.id) { app in
                    NavigationLink(destination: AppDetailView(viewModel: AppDetailViewModel(app: app))) {
                        BannerView(app: app)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

struct BannerView: View {
    let app: AppData
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack(alignment: .leading) {
            BannerBigTitleView(app: app)
            
            ZStack(alignment: .bottom) {
                app.bannerImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .background(Color.gray)
                
                BannerMiniTitleView(app: app)
            }
            .frame(width: width - 40, height: width / 2)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

struct BannerBigTitleView: View {
    let app: AppData
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(app.tag ?? "앱")
                .font(Font.system(size: 12, weight: .medium))
                .foregroundStyle(.blue)
            
            Text(app.title)
                .font(Font.system(size: 22, weight: .medium))
            
            Text(app.subtitle)
                .font(Font.system(size: 19, weight: .regular))
                .foregroundStyle(.secondary)
        }
    }
}

struct BannerMiniTitleView: View {
    let app: AppData
    
    var body: some View {
        HStack(spacing: 16) {
            iconImage
            titleVStack
            Spacer()
            DownloadButton(state: app.downloadState, buttonColor: .white) { }
        }
        .padding(20)
        .frame(maxWidth: .infinity)
    }
    
    // components
    var iconImage: some View {
        app.iconImage
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 50, height: 50)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    var titleVStack: some View {
        VStack(alignment: .leading) {
            Text(app.title)
                .font(Font.system(size: 17, weight: .semibold))
                .lineLimit(1)
            Text(app.subtitle)
                .font(Font.system(size: 15, weight: .regular))
                .lineLimit(1)
        }
        .foregroundStyle(.white)
    }
}

struct AppListHSlideView: View {
    let sectionTitle: String
    let apps: [AppData]
    let width = UIScreen.main.bounds.width
    let rows = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            sectionTitleView
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, spacing: 20) {
                    ForEach(apps, id: \.id) { app in
                        NavigationLink(destination: AppDetailView(viewModel: AppDetailViewModel(app: app))) {
                            AppCell(app: app)
                                .frame(width: width - 40)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
    }
    
    var sectionTitleView: some View {
        HStack {
            Text(sectionTitle)
                .font(Font.system(size: 24, weight: .bold))
            
            Image(systemName: "chevron.right")
                .font(Font.system(size: 20, weight: .bold))
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    AppExploreView()
}
