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
    let category: String
    var downloadState: DownloadState
}

extension App {
    static let sampleApps: [App] = [
        App(iconImage: UIImage(systemName: "soccerball")!,
            ranking: 1,
            title: "카카오톡",
            subtitle: "모든 연결의 시작",
            category: "소셜 네트워킹",
            downloadState: .update
        ),
        App(iconImage: UIImage(systemName: "camera")!,
            ranking: 2,
            title: "인스타그램",
            subtitle: "사진과 영상을 공유하세요",
            category: "사진 및 비디오",
            downloadState: .installed
        ),
        App(iconImage: UIImage(systemName: "music.note")!,
            ranking: 3,
            title: "멜론",
            subtitle: "최신 음악을 들어보세요",
            category: "음악",
            downloadState: .download
        ),
        App(iconImage: UIImage(systemName: "gamecontroller")!,
            ranking: 4,
            title: "배틀그라운드",
            subtitle: "실감나는 전투 경험",
            category: "게임",
            downloadState: .redownload
        ),
        App(iconImage: UIImage(systemName: "book")!,
            ranking: 5,
            title: "리디북스",
            subtitle: "전자책을 읽어보세요",
            category: "도서",
            downloadState: .download
        ),
        App(iconImage: UIImage(systemName: "bubble.left.and.bubble.right")!,
            ranking: 6,
            title: "디스코드",
            subtitle: "친구들과 대화해요",
            category: "소셜 네트워킹",
            downloadState: .installed
        ),
        App(iconImage: UIImage(systemName: "film")!,
            ranking: 7,
            title: "넷플릭스",
            subtitle: "영화와 드라마를 스트리밍하세요",
            category: "엔터테인먼트",
            downloadState: .update
        ),
        App(iconImage: UIImage(systemName: "cart")!,
            ranking: 8,
            title: "쿠팡",
            subtitle: "빠른 배송과 쇼핑의 즐거움",
            category: "쇼핑",
            downloadState: .redownload
        ),
        App(iconImage: UIImage(systemName: "creditcard")!,
            ranking: 9,
            title: "토스",
            subtitle: "간편한 송금과 금융 서비스",
            category: "금융",
            downloadState: .download
        ),
        App(iconImage: UIImage(systemName: "heart.text.square")!,
            ranking: 10,
            title: "트위터",
            subtitle: "전 세계의 소식을 빠르게",
            category: "소셜 네트워킹",
            downloadState: .installed
        )
    ]
}

