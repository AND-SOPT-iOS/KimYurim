//
//  MainExploreViewController.swift
//  35-seminar
//
//  Created by 김유림 on 10/30/24.
//

import UIKit

final class MainExploreViewController: BaseViewController {
    
    private let financeButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setStyle() {
        view.backgroundColor = .systemBackground
        
        financeButton.configureButton(configType: .filled, title: " 금융", fontWeight: .semibold, systemName: "dollarsign.circle", foregroundColor: .label, backgroundColor: .systemGray5)
        
        view.addSubview(financeButton)
        
        financeButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func setAddTarget() {
        financeButton.addTarget(self, action: #selector(tappedFinanceButton), for: .touchUpInside)
    }
    
    @objc func tappedFinanceButton() {
        let categoryExploreVC = CategoryExploreViewController()
        navigationController?.pushViewController(categoryExploreVC, animated: true)
    }
}
