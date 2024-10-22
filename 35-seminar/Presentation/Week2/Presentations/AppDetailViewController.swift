//
//  AppDetailViewController.swift
//  35-seminar
//
//  Created by 김유림 on 10/15/24.
//

import UIKit

class AppDetailViewController: UIViewController {
    
    // MARK: - Properties
    private let appDetailView = AppDetailView()
    
    // MARK: - Methods
    override func loadView() {
        view = appDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
