//
//  UITabBarControllerExtension.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 30.06.2021.
//

import Foundation
import UIKit

extension UITabBarController {
//    convenience init(customTabBar: Bool) {
//        self.init()
//    }
    
    func addElements(){
        let tabBarImages = TabBarImagesModel()
        self.tabBar.items? = [UITabBarItem.init(title: nil, image: tabBarImages.homeGreyImage, selectedImage: tabBarImages.homeOrangeImage),
                              UITabBarItem.init(title: nil, image: tabBarImages.profileGreyImage, selectedImage: tabBarImages.profileOrangeImage),
                              UITabBarItem.init(title: nil, image: tabBarImages.settingsGreyImage, selectedImage: tabBarImages.profileOrangeImage)]
    }
}
