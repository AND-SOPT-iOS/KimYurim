//
//  NavigationYurim.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 11/30/24.
//

import SwiftUI

struct NavigationYurim: View {
    enum Destination {
        case yurim
        case bob
        case pool
    }
    
    var body: some View {
        NavigationStack {
            NavigationLink.init("Hello") {
                Text("Hello! I'm Yurim")
            }
            
            NavigationLink.init("bob") {
                Text("Hi I'm bob")
            }
            
            NavigationLink("pool", value: Destination.pool) // 수정 필요
        }
        .navigationDestination(for: Destination.self) { destination in
            switch destination {
            case .bob:
                Text("Bob")
            case .pool:
                Text("Pool")
            case .yurim:
                Text("Yurim")
            }
        }
    }
}


#Preview {
    NavigationYurim()
}
