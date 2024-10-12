//
//  DetailViewController.swift
//  35-seminar
//
//  Created by 김유림 on 10/5/24.
//

import UIKit
import SnapKit

protocol NicknameDelegate: AnyObject {
    func dataBind(nickname: String)
}

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    let detailView = DetailView()
    weak var delegate: NicknameDelegate?
    var completionHandler: ((String) -> ())?
    
    //   MARK: - Methods
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAction()
    }
    
    private func setAction() {
        detailView.backButton.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
    }
    
    @objc func tappedBackButton() {
        if let nickname = detailView.nicknameTextField.text {
            // delegate
//            delegate?.dataBind(nickname: nickname)
            
            // closure
            completionHandler?(nickname)
        }
        
        
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func dataBind(mode: String, title: String, content: String) {
        detailView.modeLabel.text = mode
        detailView.titleLabel.text = "제목: \(title)"
        detailView.contentLabel.text = content
    }
}
