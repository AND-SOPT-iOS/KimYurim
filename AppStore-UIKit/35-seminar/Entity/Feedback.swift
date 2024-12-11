//
//  Feedback.swift
//  35-seminar
//
//  Created by 김유림 on 10/26/24.
//

import Foundation

struct Feedback {
    var title: String
    var author: String
    var starCount: Int
    var authorDate: Date?
    var content: String?
    var developerContent: String?
    var developerDate: Date?
}

extension Feedback {
    static let samples: [Feedback] = [
        Feedback(title: "김유림",
                 author: "ISTJ",
                 starCount: 5,
                 authorDate: Date(year: 2023, month: 12, day: 20),
                 content: "동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세",
                 developerContent: "안녕하세요, 토스팀입니다. 소중한 의견을 주셔서 너무나 감사합니다. 안녕하세요, 토스팀입니다. 소중한 의견을 주셔서 너무나 감사합니다.",
                 developerDate: Date(year: 2024, month: 5, day: 30)),
        Feedback(title: "너무 잘 쓰고 있어요",
                 author: "ISTJ",
                 starCount: 5,
                 authorDate: Date(year: 2023, month: 12, day: 20),
                 content: "최고예요 하하!!!",
                 developerContent: nil,
                 developerDate: nil),
        Feedback(title: "앱이 정말 좋아요~",
                 author: "뽀로로",
                 starCount: 5,
                 authorDate: Date(year: 2024, month: 1, day: 20),
                 content: """
뽀롱뽀롱 뽀로로 1기 오프닝송
야 뽀로로다
노는 게 제일 좋아 친구들 모여라
언제나 즐거워 개구쟁이 뽀로로
눈 덮인 숲 속 마을 꼬마 펭귄 나가신다
언제나 즐거워 오늘은 또 무슨 일이 생길까
뽀로로를 불러봐요 뽀롱뽀롱
뽀로로 뽀롱뽀롱 뽀로로
뽀롱뽀롱 뽀롱뽀롱 뽀롱뽀롱 뽀롱 뽀로로
노는 게 제일 좋아 친구들 모여라
언제나 즐거워
뽀롱 뽀롱 뽀롱 뽀롱 뽀로로
""",
                 developerContent: "안녕하세요, 토스팀입니다. 소중한 의견을 주셔서 너무나 감사합니다. ",
                 developerDate: Date(year: 2024, month: 5, day: 30)),
        Feedback(title: "너무 별로예요ㅠㅠㅠㅠㅠㅠ",
                 author: "피카츄",
                 starCount: 1,
                 authorDate: Date(year: 2024, month: 8, day: 20),
                 content: "뉴진스의 Ditto 불러주세요",
                 developerContent: """
훌쩍 커버렸어 함께한 기억처럼
널 보는 내 마음은
어느새 여름 지나 가을
기다렸지 all this time
Do you want somebody
Like I want somebody?
날 보고 웃었지만
Do you think about me now? Yeah
All the time, yeah, all the time
""",
                 developerDate: Date(year: 2024, month: 5, day: 30))
    ]
}
