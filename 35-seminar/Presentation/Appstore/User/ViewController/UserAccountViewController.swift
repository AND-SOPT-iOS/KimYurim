//
//  UserAccountViewController.swift
//  35-seminar
//
//  Created by 김유림 on 11/11/24.
//

import UIKit

class UserAccountViewController: BaseViewController {
    
    // MARK: - Properties
    private let userAccountView = UserAccountView()
    private var userInfo: RegisterDTO? = nil
    
    // MARK: - Methods
    init(userInfo: RegisterDTO?) {
        super.init(nibName: nil, bundle: nil)
        self.userInfo = userInfo
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = userAccountView
    }
    
    override func viewDidLoad() {
        fetchUserData()
        super.viewDidLoad()
    }
    
    override func setNavigationBar() {
        self.navigationController?
            .navigationBar
            .titleTextAttributes = [
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .semibold)]
        self.navigationItem.title = "계정"
    }
    
    override func setDelegate() {
        
    }
    
    override func bind() {
        userAccountView.bind(editable: false,
                             name: userInfo?.username ?? "",
                             hobby: userInfo?.hobby ?? "",
                             password: userInfo?.password ?? "")
    }
    
    private func fetchUserData() {
        let userData = UserDefaultsManager.fetchUserData()
    }
}
