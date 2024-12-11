//
//  AppCellView.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 11/23/24.
//

import SwiftUI

struct AppCell: View {
    
    let appStore: AppStore
    
    var body: some View {
        
        HStack(
            spacing: 12
        ) {
            iconImage
            ranking
            titleAndSubTitle
            Spacer()
            DownloadButton(state: appStore.downloadState, buttonColor: .gray) { }
        }
    }
    
    private var iconImage: some View {
        appStore.iconImage
            .resizable()
            .frame(width: 55, height: 55)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.clear)
                    .stroke(.placeholder, lineWidth: 1)
                    .frame(width: 60, height: 60)
            }
    }
    
    private var ranking: some View {
        VStack {
            Text(appStore.ranking.description)
                .font(.headline)
            Text("0")
                .foregroundStyle(.white)
                .font(.caption)
        }
    }
    
    private var titleAndSubTitle: some View {
        VStack(alignment: .leading) {
            Text(appStore.title)
                .font(.headline)
            Text(appStore.subTitle)
                .font(.caption)
        }
    }
}


#Preview {
    AppCell(appStore: AppStore(id: UUID(), iconImage: Image(systemName: "person"), ranking: 1, title: "안녕", subTitle: "안녕하세요", downloadState: .reDownload))
}
