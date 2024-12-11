//
//  App.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 11/23/24.
//

import SwiftUI

struct AppData: Identifiable {
    let id: UUID
    let iconImage: Image
    let ranking: Int
    let title: String
    let subTitle: String
    let downloadState: DownloadState
}

enum DownloadState: CustomStringConvertible {
    case download
    case downloaded
    case reDownload
    case update
    
    var description: String {
        switch self {
        case .download: return "다운로드"
        case .downloaded: return "열기"
        case .reDownload: return "클라우드"
        case .update: return "업데이트"
        }
    }
}


let sampleApps: [AppData] = [
    AppData(id: UUID(), iconImage: Image(systemName: "person"), ranking: 1, title: "안녕", subTitle: "안녕하세요", downloadState: .download),
    AppData(id: UUID(), iconImage: Image(systemName: "person"), ranking: 2, title: "안녕", subTitle: "안녕하세요", downloadState: .downloaded),
    AppData(id: UUID(), iconImage: Image(systemName: "person"), ranking: 3, title: "안녕", subTitle: "안녕하세요", downloadState: .reDownload),
    AppData(id: UUID(), iconImage: Image(systemName: "person"), ranking: 4, title: "안녕", subTitle: "안녕하세요", downloadState: .update),
    AppData(id: UUID(), iconImage: Image(systemName: "person"), ranking: 5, title: "안녕", subTitle: "안녕하세요", downloadState: .downloaded),
    AppData(id: UUID(), iconImage: Image(systemName: "person"), ranking: 6, title: "안녕", subTitle: "안녕하세요", downloadState: .reDownload),
    AppData(id: UUID(), iconImage: Image(systemName: "person"), ranking: 7, title: "안녕", subTitle: "안녕하세요", downloadState: .download),
    AppData(id: UUID(), iconImage: Image(systemName: "person"), ranking: 2, title: "안녕", subTitle: "안녕하세요", downloadState: .update),
    AppData(id: UUID(), iconImage: Image(systemName: "person"), ranking: 3, title: "안녕", subTitle: "안녕하세요", downloadState: .downloaded),
    AppData(id: UUID(), iconImage: Image(systemName: "person"), ranking: 4, title: "안녕", subTitle: "안녕하세요", downloadState: .download),
    AppData(id: UUID(), iconImage: Image(systemName: "person"), ranking: 5, title: "안녕", subTitle: "안녕하세요", downloadState: .reDownload),
    AppData(id: UUID(), iconImage: Image(systemName: "person"), ranking: 6, title: "안녕", subTitle: "안녕하세요", downloadState: .download),
    AppData(id: UUID(), iconImage: Image(systemName: "person"), ranking: 7, title: "안녕", subTitle: "안녕하세요", downloadState: .downloaded),
    AppData(id: UUID(), iconImage: Image(systemName: "person"), ranking: 8, title: "안녕", subTitle: "안녕하세요", downloadState: .update)
]


