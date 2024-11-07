//
//  App.swift
//  35-seminar
//
//  Created by 김유림 on 10/26/24.
//

import UIKit

struct App {
    let iconImage: UIImage
    let bannerImage: UIImage?
    let ranking: Int
    let title: String
    let subtitle: String
    let tag: String?
    let category: Category
    let price: Int
    var downloadState: DownloadButtonFactory.DownloadState
}

extension App {
    static let sampleApps: [App] = [
        App(iconImage: UIImage.tossIcon, bannerImage: UIImage.tossBanner, ranking: 1, title: "토스", subtitle: "금융이 쉬워진다", tag: "새로운 경험", category: .finance, price: 0, downloadState: .installed),
        App(iconImage: UIImage(systemName: "chart.bar")!, bannerImage: UIImage(systemName: "banknote"), ranking: 2, title: "Spendee Money & Budget Planner", subtitle: "금융", tag: "추천", category: .finance, price: 0, downloadState: .download),
        App(iconImage: UIImage(systemName: "creditcard")!, bannerImage: UIImage(systemName: "banknote"), ranking: 3, title: "위플 가계부 Pro", subtitle: "아이폰 사용자 수 1위 가계부", tag: "새로운 경험", category: .finance, price: 0, downloadState: .redownload),
        App(iconImage: UIImage(systemName: "dollarsign.circle")!, bannerImage: UIImage(systemName: "banknote"), ranking: 4, title: "내돈내산", subtitle: "가계부 관리 앱", tag: "새로운 앱", category: .finance, price: 0, downloadState: .update),
        App(iconImage: UIImage(systemName: "message")!, bannerImage: UIImage(systemName: "banknote"), ranking: 5, title: "톡톡", subtitle: "가족과 친구와의 소통", tag: nil, category: .socialNetwork, price: 0, downloadState: .download),
        App(iconImage: UIImage(systemName: "wallet.pass")!, bannerImage: UIImage(systemName: "banknote"), ranking: 6, title: "월렛", subtitle: "지갑 관리 및 결제", tag: nil, category: .finance, price: 0, downloadState: .installed),
        App(iconImage: UIImage(systemName: "person.3.fill")!, bannerImage: UIImage(systemName: "banknote"), ranking: 7, title: "동호회", subtitle: "취미 소셜 모임", tag: nil, category: .socialNetwork, price: 0, downloadState: .update),
        App(iconImage: UIImage(systemName: "chart.pie")!, bannerImage: UIImage(systemName: "banknote"), ranking: 8, title: "재정 분석", subtitle: "재무 상태 분석 툴", tag: "새로운 앱", category: .finance, price: 1000, downloadState: .download),
        App(iconImage: UIImage(systemName: "network")!, bannerImage: UIImage(systemName: "banknote"), ranking: 9, title: "비즈니스 네트워크", subtitle: "프로페셔널 네트워킹 앱", tag: "새로운 앱", category: .socialNetwork, price: 0, downloadState: .redownload),
        App(iconImage: UIImage(systemName: "list.bullet.rectangle.portrait")!, bannerImage: UIImage(systemName: "banknote"), ranking: 10, title: "할일메모", subtitle: "일정 관리 및 체크리스트", tag: "새로운 경험", category: .finance, price: 0, downloadState: .installed),
        App(iconImage: UIImage(systemName: "face.smiling")!, bannerImage: UIImage(systemName: "banknote"), ranking: 11, title: "웃음클럽", subtitle: "재미있는 커뮤니티", tag: "새로운 경험", category: .socialNetwork, price: 0, downloadState: .download),
        App(iconImage: UIImage(systemName: "dollarsign.square")!, bannerImage: UIImage(systemName: "banknote"), ranking: 12, title: "주식분석", subtitle: "투자 포트폴리오 관리", tag: nil, category: .finance, price: 0, downloadState: .update),
        App(iconImage: UIImage(systemName: "bubble.left.and.bubble.right")!, bannerImage: UIImage(systemName: "banknote"), ranking: 13, title: "프렌즈챗", subtitle: "전세계 친구와 소통", tag: nil, category: .socialNetwork, price: 0, downloadState: .redownload),
        App(iconImage: UIImage(systemName: "creditcard.and.123")!, bannerImage: UIImage(systemName: "banknote"), ranking: 14, title: "가계부", subtitle: "수입과 지출을 간편하게", tag: nil, category: .finance, price: 500, downloadState: .download),
        App(iconImage: UIImage(systemName: "sparkles")!, bannerImage: UIImage(systemName: "banknote"), ranking: 15, title: "명언 소셜", subtitle: "명언과 공유 커뮤니티", tag: nil, category: .socialNetwork, price: 0, downloadState: .installed),
        App(iconImage: UIImage(systemName: "briefcase.fill")!, bannerImage: UIImage(systemName: "banknote"), ranking: 16, title: "프로페셔널 네트워크", subtitle: "직장인 커뮤니티", tag: nil, category: .socialNetwork, price: 0, downloadState: .download),
        App(iconImage: UIImage(systemName: "chart.bar.xaxis")!, bannerImage: UIImage(systemName: "banknote"), ranking: 17, title: "금융 캘린더", subtitle: "주요 경제 일정 관리", tag: nil, category: .finance, price: 0, downloadState: .installed),
        App(iconImage: UIImage(systemName: "network.badge.shield.half.filled")!, bannerImage: UIImage(systemName: "banknote"), ranking: 18, title: "보안네트워크", subtitle: "안전한 네트워킹", tag: nil, category: .socialNetwork, price: 0, downloadState: .update),
        App(iconImage: UIImage(systemName: "dollarsign.arrow.circlepath")!, bannerImage: UIImage(systemName: "banknote"), ranking: 19, title: "환전마켓", subtitle: "환율 계산기와 시장", tag: nil, category: .finance, price: 0, downloadState: .redownload),
        App(iconImage: UIImage(systemName: "bubble.left.and.exclamationmark.bubble.right.fill")!, bannerImage: UIImage(systemName: "banknote"), ranking: 20, title: "비밀 톡", subtitle: "비밀 대화 기능 제공", tag: nil, category: .socialNetwork, price: 0, downloadState: .download),
        App(iconImage: UIImage(systemName: "house.fill")!, bannerImage: UIImage(systemName: "banknote"), ranking: 21, title: "스마트 홈", subtitle: "스마트 기기 통합 관리", tag: nil, category: .finance, price: 25000, downloadState: .download),
        App(iconImage: UIImage(systemName: "chart.line.uptrend.xyaxis")!, bannerImage: UIImage(systemName: "banknote"), ranking: 22, title: "투자 마스터", subtitle: "전문가의 투자 가이드", tag: nil, category: .finance, price: 35000, downloadState: .update),
        App(iconImage: UIImage(systemName: "calendar")!, bannerImage: UIImage(systemName: "banknote"), ranking: 23, title: "재정 관리 캘린더", subtitle: "예산 및 지출 일정 관리", tag: nil, category: .finance, price: 15000, downloadState: .installed),
        App(iconImage: UIImage(systemName: "lock.fill")!, bannerImage: UIImage(systemName: "banknote"), ranking: 24, title: "금융 보안 앱", subtitle: "안전한 금융 거래 보장", tag: nil, category: .finance, price: 70000, downloadState: .redownload),
        App(iconImage: UIImage(systemName: "star.fill")!, bannerImage: UIImage(systemName: "banknote"), ranking: 25, title: "투자 트래커", subtitle: "포트폴리오 성과 분석", tag: nil, category: .finance, price: 90000, downloadState: .update),
        App(iconImage: UIImage(systemName: "photo.on.rectangle")!, bannerImage: UIImage(systemName: "banknote"), ranking: 26, title: "사진 편집기", subtitle: "프로 같은 사진 편집", tag: nil, category: .finance, price: 19900, downloadState: .download),
        App(iconImage: UIImage(systemName: "book.fill")!, bannerImage: UIImage(systemName: "banknote"), ranking: 27, title: "투자 서적", subtitle: "투자에 대한 모든 것", tag: nil, category: .finance, price: 12000, downloadState: .installed),
        App(iconImage: UIImage(systemName: "wrench.fill")!, bannerImage: UIImage(systemName: "banknote"), ranking: 28, title: "가계부 도구", subtitle: "가계부 자동화 도구", tag: nil, category: .finance, price: 280000, downloadState: .download),
        App(iconImage: UIImage(systemName: "gamecontroller")!, bannerImage: UIImage(systemName: "banknote"), ranking: 29, title: "주식 게임", subtitle: "가상의 주식 거래 게임", tag: nil, category: .finance, price: 40000, downloadState: .download),
        App(iconImage: UIImage(systemName: "pencil")!, bannerImage: UIImage(systemName: "banknote"), ranking: 30, title: "메모장", subtitle: "아이디어를 쉽게 기록하세요", tag: nil, category: .finance, price: 5000, downloadState: .download)
    ]
}

