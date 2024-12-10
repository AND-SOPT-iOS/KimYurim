//
//  Grid.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 11/30/24.
//

import SwiftUI

struct GridView: View {
    var body: some View {
        Grid(alignment: .top, horizontalSpacing: .zero, verticalSpacing: .zero) {
            GridRow {
                Text("Row 1")
                ForEach(0..<2) { _ in Color.red }
            }
            GridRow {
                Text("Row 2")
                ForEach(0..<10) { _ in Color.green }
            }
            GridRow {
                Text("Row 3")
                ForEach(0..<4) { _ in Color.blue }
            }
        }
    }
}

#Preview {
    GridView()
}
