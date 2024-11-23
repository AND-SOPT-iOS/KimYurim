//
//  TabBarViewController.swift
//  35-seminar
//
//  Created by 김유림 on 11/8/24.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setVCs()
        setUI()
    }
    
    private func setUI() {
        if let items = tabBar.items {
            items[0].title = "앱"
            items[1].title = "소셜"
            
            items[0].image = UIImage(systemName: "square.stack.3d.up.fill")
            items[1].image = UIImage(systemName: "person.fill")
        }
        
        let appearance = UITabBarAppearance()
        // selected state
        let selectedAttributes: [NSAttributedString.Key : Any] = [
            .foregroundColor : UIColor.tintColor
        ]
        appearance.stackedLayoutAppearance.selected.iconColor = .tintColor
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttributes
        
        // normal state
        let normalAttributes: [NSAttributedString.Key : Any] = [
            .foregroundColor : UIColor.secondaryLabel
        ]
        appearance.stackedLayoutAppearance.normal.iconColor = .secondaryLabel
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttributes
        
        // apply
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = tabBar.standardAppearance
    }
    
    private func setVCs() {
        let exploreVC = UINavigationController(rootViewController: MainExploreViewController())
        let userVC = UINavigationController(rootViewController: SocialViewController())
        
        let viewControllers = [exploreVC, userVC]
        setViewControllers(viewControllers, animated: true)
    }
}
