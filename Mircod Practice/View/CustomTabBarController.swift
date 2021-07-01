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
        print("work")
    }
    
    func setupTabBar(){
        let vc1 = createNavController(vc: UIViewController(), selectedImage: #imageLiteral(resourceName: "profile-orange.png"), unselectedImage: #imageLiteral(resourceName: "profile-grey"))
        vc1.view.backgroundColor = .red
        let vc2 = createNavController(vc: UIViewController(), selectedImage: #imageLiteral(resourceName: "home-orange.png"), unselectedImage: #imageLiteral(resourceName: "home-grey"))
        vc2.view.backgroundColor = .green
        let vc3 = createNavController(vc: UIViewController(), selectedImage: #imageLiteral(resourceName: "settings-orange"), unselectedImage: #imageLiteral(resourceName: "settings-grey.png"))
        vc3.view.backgroundColor = .blue
        
        viewControllers = [vc1,vc2,vc3]
        
        guard let items = tabBar.items else { return }
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -20, right: 0)
            
        }
        
    }
    
    

}
