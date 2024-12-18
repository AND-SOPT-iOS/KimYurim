//
//  SUHobbyView.swift
//  35-seminar
//
//  Created by 김유림 on 11/29/24.
//

import SwiftUI

struct SUHobbyView: View {
    @State private var userHobby: String = "축구"
    @State private var hobbies: [(Int, String)] = [
        (1, "영화 보기"), (2, "야구장 가기")
    ]
    @State private var currentUserNo = 1
    @State private var isFetching = false
    @State private var hasMoreData = true
    
    private let pageSize = 30

    var body: some View {
        ScrollViewReader { proxy in
            List {
                // 나의 취미 섹션
                Section(
                    header: SUHobbyHeaderView(
                        sectionTitle: "나의 취미",
                        columnTitles: nil)
                ) {
                    if userHobby.isEmpty {
                        Text("취미 정보를 불러오는 중...")
                            .foregroundColor(.gray)
                    } else {
                        Text(userHobby)
                    }
                }
                
                // 친구들의 취미 섹션
                Section(header: SUHobbyHeaderView(
                    sectionTitle: "친구들의 취미",
                    columnTitles: ["id", "취미"])
                ) {
                    ForEach(hobbies, id: \.0) { (no, hobby) in
                        HStack {
                            Text("\(no)").frame(width: 30)
                            Text(hobby)
                        }
                    }
                    
                    // TODO: onChange 메소드에 넣기
                    if hasMoreData {
                        HStack {
                            Spacer()
                            ProgressView()
                                .onAppear {
                                    loadMoreHobbies()
                                }
                            Spacer()
                        }
                    }
                }
            }
        }
        .onAppear {
            fetchUserHobby()
        }
    }
    
    // 유저 취미 데이터를 로드하는 함수
    private func fetchUserHobby() {
        UserService.shared.fetchUserHobby(token: UserDefaultsManager.fetchUserData().token) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let hobby):
                    self.userHobby = hobby
                case .failure(let error):
                    print("hobby 조회 에러: \(error.errorMessage)")
                }
            }
        }
    }
    
    // 친구들의 취미 데이터를 로드하는 함수
    private func loadMoreHobbies() {
        guard !isFetching, hasMoreData else { return }
        isFetching = true
        
        let nextUserNos = (currentUserNo..<(currentUserNo + pageSize)).map { $0 }
        let dispatchGroup = DispatchGroup()
        var newHobbies: [(Int, String)] = []
        var successfulFetches = 0
        
        for userNo in nextUserNos {
            dispatchGroup.enter()
            UserService.shared.fetchOtherHobby(token: UserDefaultsManager.fetchUserData().token, no: userNo) { result in
                switch result {
                case .success(let hobby):
                    newHobbies.append((userNo, hobby))
                    successfulFetches += 1
                case .failure(let error):
                    print("유저 \(userNo)의 취미를 가져오지 못했습니다. error: \(error)")
                }
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            isFetching = false
            if successfulFetches == 0 {
                hasMoreData = false
                return
            }
            
            hobbies.append(contentsOf: newHobbies.sorted { $0.0 < $1.0 })
            currentUserNo += successfulFetches
        }
    }
}

struct SUHobbyHeaderView: View {
    let sectionTitle: String
    let columnTitles: [String]?
    
    var body: some View {
        VStack {
            Text(sectionTitle)
                .font(.system(size: 17, weight: .semibold))
            
            HStack {
                if let titles = columnTitles {
                    ForEach(titles, id: \.self) { column in
                        Text(column)
                            .frame(width: 30, alignment: .leading)
                    }
                }
            }
        }
    }
}


#Preview {
    SUHobbyView()
}
