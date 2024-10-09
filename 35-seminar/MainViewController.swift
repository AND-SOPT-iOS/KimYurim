//
//  ViewController.swift
//  35-seminar
//
//  Created by 김유림 on 10/5/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    let mainView = MainView()
    
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
        let detailVC = DetailViewController()
        detailVC.dataBind(mode: "", title: "", content: "" )
        
        if mainView.modePopupButton.titleLabel?.text == "네비게이션" {
            self.navigationController?.pushViewController(detailVC, animated: true)
        } else {
            self.present(detailVC, animated: true, completion: nil)
        }
    }
}

