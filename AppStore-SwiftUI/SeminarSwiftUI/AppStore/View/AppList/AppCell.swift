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
            .aspectRatio(contentMode: .fill)
            .frame(width: 60, height: 60)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.placeholder, lineWidth: 1)
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
            Text(app.subtitle)
                .font(.caption)
        }
    }
}


#Preview {
    AppCell(app: AppData(id: UUID(), ranking: 1, title: "토스", subtitle: "금융이 쉬워진다", tag: "새로운 경험", category: .finance, price: 0, downloadState: .downloaded, iconImage: Image(uiImage: UIImage.tossIcon), bannerImage: Image(uiImage: UIImage.tossBanner)))
}
