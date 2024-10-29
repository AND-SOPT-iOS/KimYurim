//
//  App.swift
//  35-seminar
//
//  Created by 김유림 on 10/26/24.
//

import UIKit

struct App {
    let iconImage: UIImage
    let ranking: Int
    let title: String
    let subtitle: String
    let category: Category
    let price: Int
    var downloadState: DownloadState
}

extension App {
    static let sampleApps: [App] = [
        App(iconImage: UIImage(systemName: "banknote")!, ranking: 1, title: "Fin - 가계부 및 예산 추적기", subtitle: "당신의 돈은 어디로 가고 있을까요?", category: .finance, price: 0, downloadState: .installed),
        App(iconImage: UIImage(systemName: "chart.bar")!, ranking: 2, title: "Spendee Money & Budget Planner", subtitle: "금융", category: .finance, price: 0, downloadState: .download),
        App(iconImage: UIImage(systemName: "creditcard")!, ranking: 3, title: "위플 가계부 Pro", subtitle: "아이폰 사용자 수 1위 가계부", category: .finance, price: 0, downloadState: .redownload),
        App(iconImage: UIImage(systemName: "dollarsign.circle")!, ranking: 4, title: "내돈내산", subtitle: "가계부 관리 앱", category: .finance, price: 0, downloadState: .update),
        App(iconImage: UIImage(systemName: "message")!, ranking: 5, title: "톡톡", subtitle: "가족과 친구와의 소통", category: .socialNetwork, price: 0, downloadState: .download),
        App(iconImage: UIImage(systemName: "wallet.pass")!, ranking: 6, title: "월렛", subtitle: "지갑 관리 및 결제", category: .finance, price: 0, downloadState: .installed),
        App(iconImage: UIImage(systemName: "person.3.fill")!, ranking: 7, title: "동호회", subtitle: "취미 소셜 모임", category: .socialNetwork, price: 0, downloadState: .update),
        App(iconImage: UIImage(systemName: "chart.pie")!, ranking: 8, title: "재정 분석", subtitle: "재무 상태 분석 툴", category: .finance, price: 1000, downloadState: .download),
        App(iconImage: UIImage(systemName: "network")!, ranking: 9, title: "비즈니스 네트워크", subtitle: "프로페셔널 네트워킹 앱", category: .socialNetwork, price: 0, downloadState: .redownload),
        App(iconImage: UIImage(systemName: "list.bullet.rectangle.portrait")!, ranking: 10, title: "할일메모", subtitle: "일정 관리 및 체크리스트", category: .finance, price: 0, downloadState: .installed),
        App(iconImage: UIImage(systemName: "face.smiling")!, ranking: 11, title: "웃음클럽", subtitle: "재미있는 커뮤니티", category: .socialNetwork, price: 0, downloadState: .download),
        App(iconImage: UIImage(systemName: "dollarsign.square")!, ranking: 12, title: "주식분석", subtitle: "투자 포트폴리오 관리", category: .finance, price: 0, downloadState: .update),
        App(iconImage: UIImage(systemName: "bubble.left.and.bubble.right")!, ranking: 13, title: "프렌즈챗", subtitle: "전세계 친구와 소통", category: .socialNetwork, price: 0, downloadState: .redownload),
        App(iconImage: UIImage(systemName: "creditcard.and.123")!, ranking: 14, title: "가계부", subtitle: "수입과 지출을 간편하게", category: .finance, price: 500, downloadState: .download),
        App(iconImage: UIImage(systemName: "sparkles")!, ranking: 15, title: "명언 소셜", subtitle: "명언과 공유 커뮤니티", category: .socialNetwork, price: 0, downloadState: .installed),
        App(iconImage: UIImage(systemName: "briefcase.fill")!, ranking: 16, title: "프로페셔널 네트워크", subtitle: "직장인 커뮤니티", category: .socialNetwork, price: 0, downloadState: .download),
        App(iconImage: UIImage(systemName: "chart.bar.xaxis")!, ranking: 17, title: "금융 캘린더", subtitle: "주요 경제 일정 관리", category: .finance, price: 0, downloadState: .installed),
        App(iconImage: UIImage(systemName: "network.badge.shield.half.filled")!, ranking: 18, title: "보안네트워크", subtitle: "안전한 네트워킹", category: .socialNetwork, price: 0, downloadState: .update),
        App(iconImage: UIImage(systemName: "dollarsign.arrow.circlepath")!, ranking: 19, title: "환전마켓", subtitle: "환율 계산기와 시장", category: .finance, price: 0, downloadState: .redownload),
        App(iconImage: UIImage(systemName: "bubble.left.and.exclamationmark.bubble.right.fill")!, ranking: 20, title: "비밀 톡", subtitle: "비밀 대화 기능 제공", category: .socialNetwork, price: 0, downloadState: .download),
        App(iconImage: UIImage(systemName: "house.fill")!, ranking: 21, title: "스마트 홈", subtitle: "스마트 기기 통합 관리", category: .finance, price: 25000, downloadState: .download),
        App(iconImage: UIImage(systemName: "chart.line.uptrend.xyaxis")!, ranking: 22, title: "투자 마스터", subtitle: "전문가의 투자 가이드", category: .finance, price: 35000, downloadState: .update),
        App(iconImage: UIImage(systemName: "calendar")!, ranking: 23, title: "재정 관리 캘린더", subtitle: "예산 및 지출 일정 관리", category: .finance, price: 15000, downloadState: .installed),
        App(iconImage: UIImage(systemName: "lock.fill")!, ranking: 24, title: "금융 보안 앱", subtitle: "안전한 금융 거래 보장", category: .finance, price: 70000, downloadState: .redownload),
        App(iconImage: UIImage(systemName: "star.fill")!, ranking: 25, title: "투자 트래커", subtitle: "포트폴리오 성과 분석", category: .finance, price: 90000, downloadState: .update),
        App(iconImage: UIImage(systemName: "photo.on.rectangle")!, ranking: 26, title: "사진 편집기", subtitle: "프로 같은 사진 편집", category: .finance, price: 19900, downloadState: .download),
        App(iconImage: UIImage(systemName: "book.fill")!, ranking: 27, title: "투자 서적", subtitle: "투자에 대한 모든 것", category: .finance, price: 12000, downloadState: .installed),
        App(iconImage: UIImage(systemName: "wrench.fill")!, ranking: 28, title: "가계부 도구", subtitle: "가계부 자동화 도구", category: .finance, price: 280000, downloadState: .download),
        App(iconImage: UIImage(systemName: "gamecontroller")!, ranking: 29, title: "주식 게임", subtitle: "가상의 주식 거래 게임", category: .finance, price: 40000, downloadState: .download),
        App(iconImage: UIImage(systemName: "pencil")!, ranking: 30, title: "메모장", subtitle: "아이디어를 쉽게 기록하세요", category: .finance, price: 5000, downloadState: .download)
    ]
}

