//
//  DetailViewController.swift
//  AppstoreClone
//
//  Created by 김유림 on 10/12/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    let detailView = DetailView()
    
    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
