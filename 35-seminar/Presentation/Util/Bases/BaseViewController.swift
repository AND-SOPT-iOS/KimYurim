//
//  BaseViewController.swift
//  35-seminar
//
//  Created by 김유림 on 10/30/24.
//

import UIKit

protocol BaseViewControllerProtocol: AnyObject {
    func setDelegate()
    func setStyle()
    func setAddTarget()
    func bind()
}

class BaseViewController: UIViewController, BaseViewControllerProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setStyle()
        setAddTarget()
        bind()
    }
    
    func setDelegate() { }
    
    func setStyle() { }
    
    func setAddTarget() { }
    
    func bind() { }
}

