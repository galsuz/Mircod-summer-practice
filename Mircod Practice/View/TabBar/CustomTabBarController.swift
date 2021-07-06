//
//  CustomTabBarController.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 01.07.2021.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    private let tabBarImages = TabBarImagesModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    func setupTabBar(){
        let vc1 = createNavController(vc: ProfileViewController(), image: #imageLiteral(resourceName: "profile-grey"))
        vc1.view.backgroundColor = .red
        // MARK: - change to MainViewController -->
        let vc2 = createNavController(vc: UIViewController(), image: #imageLiteral(resourceName: "home-grey"))
        vc2.view.backgroundColor = .green
        let vc3 = createNavController(vc: SettingsViewController(), image: #imageLiteral(resourceName: "settings-grey.png"))
        // MARK: - when create setting - change to settingsController
        let vc3 = createNavController(vc: UIViewController(), image: #imageLiteral(resourceName: "settings-grey.png"))
        // HELLO WORLD
        vc3.view.backgroundColor = .blue
        
        tabBar.tintColor = UIColor.mainOrangeColor
        
        viewControllers = [vc1,vc2,vc3]
        
        guard let items = tabBar.items else { return }
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -20, right: 0)
        }
        
    }
    
    

}
