//
//  EasyAlert.swift
//  35-seminar
//
//  Created by 김유림 on 11/8/24.
//

import UIKit

class EasyAlert {
    static func showAlert(title: String?, message: String?, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .cancel)
        alert.addAction(ok)
        vc.present(alert, animated: true)
    }
    
    static func dismissModalAlert(title: String?, message: String?, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .cancel) { [weak vc] _ in
            vc?.dismiss(animated: true)
        }
        alert.addAction(ok)
        vc.present(alert, animated: true)
    }
}
