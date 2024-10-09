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
    var isNavigation: Bool = true
    let mainView = MainView()
    
    // MARK: - Methods
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainView.updateTitleLabel(isNavigation: isNavigation)
    }
    
    private func setAction() {
        mainView.nextButton.addTarget(self, action: #selector(tappedNextButton), for: .touchUpInside)
        mainView.modePopupButton.addTarget(self, action: #selector(tappedModeButton), for: .touchUpInside)
    }
    
    @objc func tappedNextButton() {
        let detailVC = DetailViewController()
        detailVC.dataBind(mode: "", title: "", content: "" )
        
        if isNavigation {
            self.navigationController?.pushViewController(detailVC, animated: true)
        } else {
            self.present(detailVC, animated: true, completion: nil)
        }
    }
    
    @objc func tappedModeButton() {
        isNavigation = !isNavigation
        mainView.updateTitleLabel(isNavigation: isNavigation)
    }
}

