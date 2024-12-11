//
//  AppDetailView.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 12/11/24.
//

import SwiftUI

struct AppDetailView: View {
    let app: AppStore
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                AppDetailTitleView(app: app)
                border
                AppDetailSummaryView()
                border
            }
        }
        .padding(.horizontal, 20)
    }
    
    // MARK: - Components
    var border: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundStyle(Color(.systemGray5))
    }
}


// MARK: - Components

struct AppDetailTitleView: View {
    let app: AppStore
    
    var body: some View {
        titleHStack
    }
    
    // components
    
    var titleHStack: some View {
        HStack {
            app.iconImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 128, height: 128)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.placeholder, lineWidth: 1)
                )
            titleVStack
            Spacer()
            shareVStack
        }
    }
    
    var titleVStack: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(app.title)
                .font(.title2)
                .fontWeight(.medium)
            
            Text(app.subTitle)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Spacer()
            
            DownloadButton(state: .download, buttonColor: .blue) { }
        }
    }
    
    var shareVStack: some View {
        VStack {
            Spacer()
            Image(systemName: "square.and.arrow.up")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 18)
                .foregroundStyle(.blue)
                .fontWeight(.medium)
        }
    }
}


struct AppDetailSummaryView: View {
    var body: some View {
        summaryHstack
    }
    
    var border: some View {
        Rectangle()
            .frame(width: 1)
            .foregroundStyle(Color(.systemGray5))
    }
    
    var summaryHstack: some View {
        HStack {
            ratingVStack
                .frame(maxWidth: .infinity)
            border
            prizeVStack
                .frame(maxWidth: .infinity)
            border
            ageVStack
                .frame(maxWidth: .infinity)
        }
        .frame(height: 76)
    }
    
    // rating
    var ratingVStack: some View {
        VStack {
            Text("8.5만개의 평가")
                .font(Font.system(size: 13, weight: .medium))
            Spacer()
            Text("4.4")
                .font(Font.system(size: 26, weight: .bold))
            Spacer()
            starsHStack
        }
        .foregroundStyle(.secondary)
    }
    
    var starsHStack: some View {
        HStack(spacing: 2) {
            Image(systemName: "star.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 15)
            Image(systemName: "star.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 15)
            Image(systemName: "star.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 15)
            Image(systemName: "star.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 15)
            Image(systemName: "star")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 15)
        }
    }
    
    // prize
    var prizeVStack: some View {
        VStack {
            Text("수상")
                .font(Font.system(size: 13, weight: .medium))
            Spacer()
            Text("에디터의 선택")
                .font(Font.system(size: 18, weight: .bold))
            Spacer()
            Text("앱")
        }
        .foregroundStyle(.secondary)
    }
    
    // age
    var ageVStack: some View {
        VStack {
            Text("연령")
                .font(Font.system(size: 13, weight: .medium))
            Spacer()
            Text("4+")
                .font(Font.system(size: 26, weight: .bold))
            Spacer()
            Text("세")
        }
        .foregroundStyle(.secondary)
    }
}


#Preview {
    AppDetailView(app: AppStore(id: UUID(), iconImage: Image(systemName: "person"), ranking: 1, title: "안녕", subTitle: "안녕하세요", downloadState: .reDownload))
}
