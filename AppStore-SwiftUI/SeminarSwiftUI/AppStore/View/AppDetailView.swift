//
//  AppDetailView.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 12/11/24.
//

import SwiftUI

struct AppDetailView: View {
    let viewModel: AppDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                AppDetailTitleView(app: viewModel.app)
                border
                AppDetailSummaryView()
                border
                AppDetailVersionView()
                border
                AppDetailPreviewView()
                border
            }
        }
        .padding(.horizontal, 20)
        .toolbar {
            ToolbarItem(placement: .principal) {
                viewModel.app.iconImage
                    .resizable()
                    .frame(width: 24, height: 24)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .overlay {
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.placeholder, lineWidth: 1)
                    }
                
                // TODO: 우측에 다운로드 버튼 넣기
                // 버튼 넣으면 에러 나는 문제 있음
            }
        }
    }
    
    var border: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundStyle(Color(.systemGray5))
    }
}


// MARK: - Components

struct AppDetailTitleView: View {
    let app: AppData
    
    var body: some View {
        titleHStack
    }
    
    // components
    
    var titleHStack: some View {
        HStack(spacing: 16) {
            app.iconImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 128, height: 128)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.placeholder, lineWidth: 1)
                )
            titleVStack
        }
    }
    
    var titleVStack: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(app.title)
                .font(Font.system(size: 23, weight: .medium))
            
            Text(app.subtitle)
                .font(Font.system(size: 16, weight: .regular))
                .foregroundStyle(.secondary)
            Spacer()
            
            HStack {
                DownloadButton(app: app, buttonColor: .blue) { }
                Spacer()
                shareButton
            }
        }
    }
    
    var shareButton: some View {
        Button {
        } label: {
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

struct AppDetailVersionView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            titleButton
            subTitleHStack
            content
        }
    }
    
    var titleButton: some View {
        Button {
            
        } label: {
            Text("새로운 소식")
                .font(Font.system(size: 23, weight: .bold))
                .foregroundStyle(.black)
            Image(systemName: "chevron.right")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 18)
                .fontWeight(.bold)
                .tint(.gray)
        }
    }
    
    var subTitleHStack: some View {
        HStack {
            Text("버전 5.192.1")
                .font(Font.system(size: 16, weight: .regular))
            Spacer()
            Text("2일 전")
                .font(Font.system(size: 16, weight: .regular))
        }
        .foregroundStyle(.secondary)
    }
    
    var content: some View {
        Text("• 구석구석 숨어있던 버그들을 잡았어요. 또 다른 버그가 나타나면 토스 고객센터를 찾아주세요. 늘 열려있답니다. 365일 24시간 언제든지요.")
            .font(Font.system(size: 16, weight: .regular))
            .lineSpacing(8)
    }
}

struct AppDetailPreviewView: View {
    let width = UIScreen.main.bounds.width
    let previewStr: [String] = [
        "toss_preview1",
        "toss_preview2",
        "toss_preview3",
        "toss_preview4",
        "toss_preview5",
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            title
            imageSlide
            device
        }
    }
    
    var title: Text {
        Text("미리 보기")
            .font(Font.system(size: 23, weight: .bold))
            .foregroundStyle(.black)
    }
    
    var imageSlide: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(previewStr, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: width - 100)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.placeholder, lineWidth: 1)
                        )
                }
            }
        }
    }
    
    var device: some View {
        HStack {
            Image(systemName: "iphone")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 18)
                .tint(.secondary)
            
            Text("iPhone")
                .foregroundStyle(.secondary)
                .font(Font.system(size: 16, weight: .medium))
        }
    }
}


#Preview {
    AppDetailView(viewModel: AppDetailViewModel(app: AppData(id: UUID(), ranking: 1, title: "토스", subtitle: "금융이 쉬워진다", tag: "새로운 경험", category: .finance, price: 0, downloadState: .downloaded, iconImage: Image(uiImage: UIImage.tossIcon), bannerImage: Image(uiImage: UIImage.tossBanner))))
}
