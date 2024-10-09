//
//  DetailViewController.swift
//  35-seminar
//
//  Created by 김유림 on 10/5/24.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    let detailView = DetailView()
    
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
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func dataBind(mode: String, title: String, content: String) {
        detailView.modeLabel.text = mode
        detailView.titleLabel.text = title
        detailView.contentLabel.text = content
    }
}
