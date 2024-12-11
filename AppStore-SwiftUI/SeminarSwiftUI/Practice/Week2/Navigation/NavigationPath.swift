//
//  NavigationPath.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 11/30/24.
//

import SwiftUI

struct NavigationPathExampleView: View {
    enum Destination: Hashable {
        case detail
        case setting
        case profile

        var title: String {
            switch self {
            case .detail:
                "Go To Detail"
            case .setting:
                "Go To Setting"
            case .profile:
                "Go To Profile"
            }
        }
    }

    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            List {
                // 1. NavigationLink로 이동
                NavigationLink(Destination.detail.title, value: Destination.detail)

                // 2. 또는 버튼 / 액션으로 이동
                Button(Destination.detail.title) {
                    path.append(Destination.detail)
                }

                // 3. 여러 화면을 이동하는 경우
                Button("Go to Setting then Detail") {
                    path.append(Destination.setting)
                    path.append(Destination.detail)
                }
            }
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .detail:
                    DetailView(path: $path)
                case .setting:
                    Text("Setting View")
                case .profile:
                    Text("Profile View")
                }
            }
        }
    }
}

struct DetailView: View {
    @Binding var path: NavigationPath

    var body: some View {
        Button("Back To Root") {
            path.removeLast(2)
        }
    }
}

#Preview {
    NavigationPathExampleView()
}
