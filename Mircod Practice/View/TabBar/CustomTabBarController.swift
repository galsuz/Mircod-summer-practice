//
//  CustomTabBarController.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 01.07.2021.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    func setupTabBar() {
        
        let vc1 = createNavController(vc: ProfileViewController(), image: #imageLiteral(resourceName: "profile-grey"))
        // MARK: - change to MainViewController -->
        let vc2 = createNavController(vc: MainViewController(), image: #imageLiteral(resourceName: "home-grey"))
        vc2.view.backgroundColor = .green
        let vc3 = createNavController(vc: SettingsViewController(), image: #imageLiteral(resourceName: "settings-grey.png"))
        vc3.view.backgroundColor = .white
//        vc3.tabBarItem.title = nil
        
        tabBar.tintColor = UIColor.mainOrangeColor
        
        viewControllers = [vc1,vc2,vc3]
        
//        guard let items = tabBar.items else { return }
//        for item in items {
//            item.title = ""
//            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -20, right: 0)
//        }
        
        tabBar.items?.forEach({ item in
            item.title = nil
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -20, right: 0)
        })
    }
}
