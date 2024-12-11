//
//  AppCellView.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 11/23/24.
//

import SwiftUI

struct AppCell: View {
    
    let app: AppData
    
    var body: some View {
        
        HStack(
            spacing: 12
        ) {
            iconImage
            ranking
            titleAndSubTitle
            Spacer()
            DownloadButton(state: app.downloadState, buttonColor: .gray) { }
        }
    }
    
    private var iconImage: some View {
        app.iconImage
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
            Text(app.ranking.description)
                .font(.headline)
            Text("0")
                .foregroundStyle(.white)
                .font(.caption)
        }
    }
    
    private var titleAndSubTitle: some View {
        VStack(alignment: .leading) {
            Text(app.title)
                .font(.headline)
            Text(app.subTitle)
                .font(.caption)
        }
    }
}


#Preview {
    AppCell(app: AppData(id: UUID(), iconImage: Image(systemName: "person"), ranking: 1, title: "안녕", subTitle: "안녕하세요", downloadState: .reDownload))
}
