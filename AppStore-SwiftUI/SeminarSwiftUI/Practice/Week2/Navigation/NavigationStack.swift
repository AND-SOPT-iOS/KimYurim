//
//  Navigation.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 11/30/24.
//

import SwiftUI

struct NavigationExampleView: View {
    enum Destination: Hashable {
        case detail
        case setting
        case profile

        var title: String {
            switch self {
            case .detail:
                "detail"
            case .setting:
                "setting"
            case .profile:
                "profile"
            }
        }
    }

    var body: some View {
        NavigationStack {
            List {
                NavigationLink(value: Destination.detail) {
                    Text(Destination.detail.title)
                }
                NavigationLink(value: Destination.setting) {
                    Text(Destination.setting.title)
                }
                NavigationLink(value: Destination.profile) {
                    Text(Destination.profile.title)
                }
            }
            .navigationTitle("메인")
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .detail:
                    Text("Detail")
                case .setting:
                    Text("Setting View")
                case .profile:
                    Text("Profile View")
                }
            }
        }
    }
}

#Preview {
    NavigationExampleView()
}
