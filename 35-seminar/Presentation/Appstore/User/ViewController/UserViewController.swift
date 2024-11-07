//
//  UserViewController.swift
//  35-seminar
//
//  Created by 김유림 on 11/8/24.
//

import UIKit

class UserViewController: BaseViewController {
    
    private let userView = UserView()
    
    override func loadView() {
        view = userView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setDelegate() { }
    
    override func setStyle() { }
    
    override func setAddTarget() { }
    
    override func bind() { }
}

