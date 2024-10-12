//
//  DetailView.swift
//  AppstoreClone
//
//  Created by 김유림 on 10/12/24.
//

import UIKit

class DetailView: BaseView {
    
    // MARK: - Properties
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    private let redView = UIView()
    private let yellowView = UIView()
    private let greenView = UIView()
    
    // MARK: - Methods
    override func setUI() {
        super.setUI()
        redView.backgroundColor = .red
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = .green
    }
    
    override func setHierarchy() {
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [redView, yellowView, greenView].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func setConstraints() {
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
            $0.height.equalTo(300)
        }
        
        yellowView.snp.makeConstraints {
            $0.top.equalTo(redView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(300)
        }
        
        greenView.snp.makeConstraints {
            $0.top.equalTo(yellowView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(300)
            $0.bottom.equalToSuperview()
        }
    }
}
