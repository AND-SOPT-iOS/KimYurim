//
//  DownloadButton.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 12/11/24.
//

import SwiftUI

struct DownloadButton: View {
    enum ButtonColor {
        case blue
        case gray
        case white
        
        var backgroundColor: Color {
            switch self {
            case .blue:
                return .blue
            case .gray:
                return Color(.systemGray5)
            case .white:
                return Color(white: 0.7, opacity: 0.5)
            }
        }
        
        var foregroundColor: Color {
            switch self {
            case .blue:
                return .white
            case .gray:
                return .blue
            case .white:
                return .white
            }
        }
        
        var redownloadColor: Color {
            switch self {
            case .blue, .gray:
                return .blue
            case .white:
                return .white
            }
        }
    }
    
    var state: DownloadState
    var buttonColor: ButtonColor
    var action: () -> Void
    
    
    var body: some View {
        switch state {
        case .download, .downloaded, .update:
            Button(action: action) {
                Text(state.description)
                    .font(Font.system(size: 16, weight: .bold))
                    .foregroundStyle(buttonColor.foregroundColor)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .tint(buttonColor.backgroundColor)
            .frame(width: 84, height: 32)
            
        case .redownload:
            Button(action: action) {
                Image(systemName: "icloud.and.arrow.down")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .fontWeight(.semibold)
                    .foregroundStyle(buttonColor.redownloadColor)
                    .frame(width: 84, height: 24)
            }
        }
    }
}

#Preview {
    DownloadButton(state: .redownload, buttonColor: .white) { }
}
