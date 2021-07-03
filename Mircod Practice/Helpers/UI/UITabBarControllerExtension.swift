//
//  UITabBarControllerExtension.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 30.06.2021.
//

import Foundation
import UIKit

extension UITabBarController {
    
    func createNavController(vc: UIViewController, image: UIImage) -> UINavigationController {
        
        let viewController = vc
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = image
        navController.tabBarItem.selectedImage?.withTintColor(UIColor.mainOrangeColor)
        
        return navController
    }
}
