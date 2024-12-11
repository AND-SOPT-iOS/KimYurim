//
//  App.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 11/23/24.
//

import SwiftUI

struct AppData: Identifiable {
    let id: UUID
    let ranking: Int
    let title: String
    let subtitle: String
    let tag: String?
    let category: Category
    let price: Int
    let downloadState: DownloadState
    let iconImage: Image
    let bannerImage: Image
}

enum Category {
    case finance
    case socialNetwork
}

enum DownloadState: CustomStringConvertible {
    case download
    case downloaded
    case redownload
    case update
    
    var description: String {
        switch self {
        case .download: return "다운로드"
        case .downloaded: return "열기"
        case .redownload: return "클라우드"
        case .update: return "업데이트"
        }
    }
}


let sampleApps: [AppData] = [
    AppData(id: UUID(), ranking: 1, title: "토스", subtitle: "금융이 쉬워진다", tag: "새로운 경험", category: .finance, price: 0, downloadState: .downloaded, iconImage: Image(uiImage: UIImage.tossIcon), bannerImage: Image(uiImage: UIImage.tossBanner)),
    AppData(id: UUID(), ranking: 2, title: "Spendee Money & Budget Planner", subtitle: "금융", tag: "추천", category: .finance, price: 0, downloadState: .download, iconImage: Image(systemName: "chart.bar"), bannerImage: Image(systemName: "banknote")),
    AppData(id: UUID(), ranking: 3, title: "위플 가계부 Pro", subtitle: "아이폰 사용자 수 1위 가계부", tag: "새로운 경험", category: .finance, price: 0, downloadState: .redownload, iconImage: Image(systemName: "creditcard"), bannerImage: Image(systemName: "banknote")),
    AppData(id: UUID(), ranking: 4, title: "내돈내산", subtitle: "가계부 관리 앱", tag: "새로운 앱", category: .finance, price: 0, downloadState: .update, iconImage: Image(systemName: "dollarsign.circle"), bannerImage: Image(systemName: "banknote")),
    AppData(id: UUID(), ranking: 5, title: "톡톡", subtitle: "가족과 친구와의 소통", tag: nil, category: .socialNetwork, price: 0, downloadState: .download, iconImage: Image(systemName: "message"), bannerImage: Image(systemName: "banknote")),
    AppData(id: UUID(), ranking: 6, title: "월렛", subtitle: "지갑 관리 및 결제", tag: nil, category: .finance, price: 0, downloadState: .downloaded, iconImage: Image(systemName: "wallet.pass"), bannerImage: Image(systemName: "banknote")),
    AppData(id: UUID(), ranking: 7, title: "동호회", subtitle: "취미 소셜 모임", tag: nil, category: .socialNetwork, price: 0, downloadState: .update, iconImage: Image(systemName: "person.3.fill"), bannerImage: Image(systemName: "banknote")),
    AppData(id: UUID(), ranking: 8, title: "재정 분석", subtitle: "재무 상태 분석 툴", tag: "새로운 앱", category: .finance, price: 1000, downloadState: .download, iconImage: Image(systemName: "chart.pie"), bannerImage: Image(systemName: "banknote")),
    AppData(id: UUID(), ranking: 9, title: "비즈니스 네트워크", subtitle: "프로페셔널 네트워킹 앱", tag: "새로운 앱", category: .socialNetwork, price: 0, downloadState: .redownload, iconImage: Image(systemName: "network"), bannerImage: Image(systemName: "banknote")),
    AppData(id: UUID(), ranking: 10, title: "할일메모", subtitle: "일정 관리 및 체크리스트", tag: "새로운 경험", category: .finance, price: 0, downloadState: .downloaded, iconImage: Image(systemName: "list.bullet.rectangle.portrait"), bannerImage: Image(systemName: "banknote")),
    AppData(id: UUID(), ranking: 11, title: "웃음클럽", subtitle: "재미있는 커뮤니티", tag: "새로운 경험", category: .socialNetwork, price: 0, downloadState: .download, iconImage: Image(systemName: "face.smiling"), bannerImage: Image(systemName: "banknote")),
    AppData(id: UUID(), ranking: 12, title: "주식분석", subtitle: "투자 포트폴리오 관리", tag: nil, category: .finance, price: 0, downloadState: .update, iconImage: Image(systemName: "dollarsign.square"), bannerImage: Image(systemName: "banknote")),
    AppData(id: UUID(), ranking: 13, title: "프렌즈챗", subtitle: "전세계 친구와 소통", tag: nil, category: .socialNetwork, price: 0, downloadState: .redownload, iconImage: Image(systemName: "bubble.left.and.bubble.right"), bannerImage: Image(systemName: "banknote")),
    AppData(id: UUID(), ranking: 14, title: "가계부", subtitle: "수입과 지출을 간편하게", tag: nil, category: .finance, price: 500, downloadState: .download, iconImage: Image(systemName: "creditcard.and.123"), bannerImage: Image(systemName: "banknote")),
    AppData(id: UUID(), ranking: 15, title: "명언 소셜", subtitle: "명언과 공유 커뮤니티", tag: nil, category: .socialNetwork, price: 0, downloadState: .downloaded, iconImage: Image(systemName: "sparkles"), bannerImage: Image(systemName: "banknote"))
]
