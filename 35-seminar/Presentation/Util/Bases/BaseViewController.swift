//
//  BaseViewController.swift
//  35-seminar
//
//  Created by 김유림 on 10/30/24.
//

import UIKit

protocol BaseViewControllerProtocol: AnyObject {
    func setStyle()
    func setDelegate()
    func setAddTarget()
    func bind()
}

class BaseViewController: UIViewController, BaseViewControllerProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setDelegate()
        setAddTarget()
        bind()
    }
    
    func setStyle() { }
    
    func setDelegate() { }
    
    func setAddTarget() { }
    
    func bind() { }
}

