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
    
    var app: AppData
    var buttonColor: ButtonColor
    var action: () -> Void
    var description: String
    
    init(app: AppData, buttonColor: ButtonColor, action: @escaping () -> Void) {
        self.app = app
        self.buttonColor = buttonColor
        self.action = action
        self.description = {
            switch app.downloadState {
            case .download:
                return app.price == 0 ? "다운로드" : app.price.formattedToWonString()
                
            case .downloaded, .redownload, .update:
                return app.downloadState.description
            }
        }()
    }
    
    var body: some View {
        switch app.downloadState {
        case .download, .downloaded, .update:
            Button(action: action) {
                Text(description)
                    .font(Font.system(size: fontSize(for: description), weight: .bold))
                    .foregroundStyle(buttonColor.foregroundColor)
                    .frame(minWidth: 58, maxWidth: 64)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .tint(buttonColor.backgroundColor)
            .frame(height: 32)
            .fixedSize(horizontal: true, vertical: false)
            
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
    
    private func fontSize(for text: String) -> CGFloat {
        switch text.count {
        case 5...:
            return 14
        case 6...:
            return 12
        default:
            return 16
        }
    }
}

#Preview {
    DownloadButton(app: AppData(id: UUID(), ranking: 1, title: "토스", subtitle: "금융이 쉬워진다", tag: "새로운 경험", category: .finance, price: 10000000, downloadState: .download, iconImage: Image(uiImage: UIImage.tossIcon), bannerImage: Image(uiImage: UIImage.tossBanner)), buttonColor: .blue) { }
}
