//
//  AppCellView.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 11/23/24.
//

import SwiftUI

//struct AppCellView: View {
//    let app: AppStore
//
//    var body: some View {
//        HStack {
//            iconImage
//            listNumber
//            titleView
//        }
//    }
//
//    var iconImage: some View {
//        Image(systemName: "person")
//    }
//
//    var listNumber: some View {
//        Text("1")
//    }
//
//    var titleView: some View {
//        VStack {
//            Text("제목")
//            Text("subTitle")
//        }
//    }
//
//    var downloadButton: some View {
//        Button {
//
//        } label: {
//            Text("다운로드")
//        }
//    }
//}


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
            downloadButton
        }
//        .padding(.horizontal, 20)
    }
    
    var iconImage: some View {
        appStore.iconImage
            .resizable()
            .frame(width: 55, height: 55)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.clear)
                    .stroke(.black, lineWidth: 1)
                    .frame(width: 60, height: 60)
            }
    }
    
    var ranking: some View {
        VStack {
            Text(appStore.ranking.description)
                .font(.headline)
            Text("0")
                .foregroundStyle(.white)
                .font(.caption)
        }
    }
    
    var titleAndSubTitle: some View {
        VStack(alignment: .leading) {
            Text(appStore.title)
                .font(.headline)
            Text(appStore.subTitle)
                .font(.caption)
        }
    }
    
    var downloadButton: some View {
        Button {
            
        } label: {
            Text(appStore.downloadState.description)
                .foregroundStyle(.blue)
        }
    }
}


#Preview {
    AppCell(appStore: AppStore(id: UUID(), iconImage: Image(systemName: "person"), ranking: 1, title: "안녕", subTitle: "안녕하세요", downloadState: .download))
}
