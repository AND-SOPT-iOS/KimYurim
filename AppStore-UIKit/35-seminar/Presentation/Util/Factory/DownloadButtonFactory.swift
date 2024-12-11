//
//  DownloadState.swift
//  35-seminar
//
//  Created by 김유림 on 10/26/24.
//

import UIKit

enum DownloadButtonFactory {
    enum DownloadState {
        case installed
        case download
        case redownload
        case update
    }
    
    static func shapeButton(button: UIButton, type: DownloadState, price: Int) {
        switch type {
        case .installed:
            DownloadButtons.installedButton().setConfig(button, price: price)
        case .download:
            DownloadButtons.downloadButton().setConfig(button, price: price)
        case .redownload:
            DownloadButtons.redownloadButton().setConfig(button, price: price)
        case .update:
            DownloadButtons.updateButton().setConfig(button, price: price)
        }
    }
}

protocol ConfigSetting {
    func setConfig(_ button: UIButton, price: Int)
}

class DownloadButtons {
    class installedButton: ConfigSetting {
        func setConfig(_ button: UIButton, price: Int) {
            button.configureButton(configType: .gray, title: "열기", fontSize: 16, fontWeight: .bold, cornerStyle: .capsule)
        }
    }
    
    class downloadButton: ConfigSetting {
        func setConfig(_ button: UIButton, price: Int) {
            if price == 0 {
                button.configureButton(configType: .gray, title: "받기", fontSize: 16, fontWeight: .bold, cornerStyle: .capsule)
            } else {
                let size: CGFloat = {
                    if price < 10000 { return 16 }
                    else if price < 100000 { return 14 }
                    else { return 11 }
                }()
                
                button.configureButton(configType: .gray, title: price.toWonString(), fontSize: size, fontWeight: .bold, cornerStyle: .capsule)
            }
        }
    }
    
    class redownloadButton: ConfigSetting {
        func setConfig(_ button: UIButton, price: Int) {
            button.configureButton(configType: .plain, systemName: "icloud.and.arrow.down", pointSize: 16, symbolWeight: .semibold)
        }
    }
    
    class updateButton: ConfigSetting {
        func setConfig(_ button: UIButton, price: Int) {
            button.configureButton(configType: .gray, title: "업데이트", fontSize: 16, fontWeight: .bold, cornerStyle: .capsule)
        }
    }
}
