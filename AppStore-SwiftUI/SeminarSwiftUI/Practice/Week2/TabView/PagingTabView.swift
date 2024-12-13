//
//  PagingTabView.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 12/13/24.
//

import SwiftUI

struct PagingTabView: View {
    let items = Array(1...50) // 예시 아이템
    let pageWidth: CGFloat = UIScreen.main.bounds.width - 40 // 페이지 너비
    
    var body: some View {
        VStack {
            TabView {
                // ForEach를 사용하여 아이템들을 순차적으로 표시
                ForEach(items, id: \.self) { index in
                    VStack {
                        Text("Item \(index)")
                            .font(.largeTitle)
                            .frame(width: pageWidth, height: 300)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    .padding()
                }
            }
            .frame(height: 250)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always)) // 슬라이드 페이지 스타일
        }
    }
}


#Preview {
    PagingTabView()
}
