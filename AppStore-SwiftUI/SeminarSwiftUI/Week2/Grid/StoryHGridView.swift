//
//  StoryHGridView.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 11/30/24.
//

import SwiftUI

struct StoryHGridView: View {
    let rows = [GridItem(.fixed(50)), GridItem(.flexible())]
    
    let height = UIScreen.main.bounds.height
    let width = UIScreen.main.bounds.width
    
    let colors: [Color] = [.red, .orange, .yellow, .green]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows) {
                ForEach(0..<50) { i in
                    Text("\(i)번째 사람")
                    
                    Rectangle()
                        .foregroundStyle(colors[i % 4])
                        .frame(width: width)
                }
            }
        }
        .frame(height: height)
    }
}

#Preview {
    StoryHGridView()
}
