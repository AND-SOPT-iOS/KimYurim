//
//  BaseView.swift
//  AppstoreClone
//
//  Created by 김유림 on 10/12/24.
//

import UIKit
import SnapKit

protocol BaseViewProtocol: AnyObject {
    func setUI()
    func setHierarchy()
    func setConstraints()
}

class BaseView: UIView, BaseViewProtocol {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setHierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.backgroundColor = .white
    }
    
    func setHierarchy() { }
    
    func setConstraints() { }

}
