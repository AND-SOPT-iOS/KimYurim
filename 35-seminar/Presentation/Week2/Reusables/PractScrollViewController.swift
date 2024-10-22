//
//  PractScrollViewController.swift
//  35-seminar
//
//  Created by 김유림 on 10/15/24.
//

import UIKit
import SnapKit

class PractScrollViewController: UIViewController {
    
    // MARK: - Properties
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    private var redView = UIView()
    private let yellowView = UIView()
    private let greenView = UIView()
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setHierarchy()
        setConstraints()
    }
    
    func setUI() {
        view.backgroundColor = .lightGray
        redView.backgroundColor = .red
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = .green
    }
    
    func setHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [redView, yellowView, greenView].forEach {
            contentView.addSubview($0)
        }
    }
    
    func setConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        redView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        yellowView.snp.makeConstraints {
            $0.top.equalTo(redView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        greenView.snp.makeConstraints {
            $0.top.equalTo(yellowView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(200)
//            $0.bottom.equalToSuperview()
        }
    }
}
