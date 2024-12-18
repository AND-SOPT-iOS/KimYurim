//
//  ViewController.swift
//  35-seminar
//
//  Created by 김유림 on 10/5/24.
//

import UIKit
import SnapKit

class Week1MainViewController: UIViewController {
    
    // MARK: - Properties
    let mainView = Week1MainView()
    
    // MARK: - Methods
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAction()
    }
    
    private func setAction() {
        mainView.nextButton.addTarget(self, action: #selector(tappedNextButton), for: .touchUpInside)
    }
    
    @objc func tappedNextButton() {
        let mode = mainView.modePopupButton.titleLabel?.text ?? "미지정"
        
        let detailVC = Week1DetailViewController()
        detailVC.dataBind(mode: "\(mode)(으)로 전환됨",
                          title: mainView.titleTextField.text ?? "",
                          content: mainView.contentTextView.text ?? "" )
        
        if mode == "네비게이션" {
            self.navigationController?.pushViewController(detailVC, animated: true)
        } else if mode == "모달" {
            self.present(detailVC, animated: true, completion: nil)
        } else {
            print("⚠️Error: \(mode) mode is not supported.")
        }
    }
}

