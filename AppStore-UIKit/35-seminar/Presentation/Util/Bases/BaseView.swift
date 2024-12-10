//
//  BaseView.swift
//  35-seminar
//
//  Created by 김유림 on 10/30/24.
//

import UIKit
import SnapKit

protocol BaseViewProtocol {
    func setDelegate()
    func setUI()
    func setHierarchy()
    func setConstraints()
}

class BaseView: UIView, BaseViewProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setDelegate()
        setUI()
        setHierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDelegate() { }
    
    func setUI() {
        self.backgroundColor = .systemBackground
    }
    
    func setHierarchy() { }
    
    func setConstraints() { }
}
