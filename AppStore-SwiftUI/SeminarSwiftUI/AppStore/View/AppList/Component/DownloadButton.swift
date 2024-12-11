//
//  DownloadButton.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 12/11/24.
//

import SwiftUI

struct DownloadButton: View {
    var state: DownloadState
    var action: () -> Void
    
    var body: some View {
        switch state {
        case .download, .downloaded, .update:
            Button(action: action) {
                Text(state.description)
                    .fontWeight(.bold)
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .tint(Color(.systemGray5))
            .frame(width: 84, height: 32)
            
        case .reDownload:
            Button(action: action) {
                Image(systemName: "icloud.and.arrow.down")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .fontWeight(.semibold)
                    .frame(width: 84, height: 24)
            }
        }
    }
}

#Preview {
    DownloadButton(state: .reDownload) { }
}
