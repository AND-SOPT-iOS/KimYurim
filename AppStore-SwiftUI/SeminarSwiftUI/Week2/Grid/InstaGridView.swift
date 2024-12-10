//
//  File.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 11/30/24.
//

import SwiftUI

struct InstaGridView: View {
    
    let columns = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1)
    ]
    
    let height = UIScreen.main.bounds.width / 3
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 1) {
                ForEach(0..<100) { _ in
                    Rectangle()
                        .frame(height: height)
                        .foregroundStyle(.blue)
                }
            }
        }
    }
}

#Preview {
    InstaGridView()
}
