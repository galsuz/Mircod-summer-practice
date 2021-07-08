//
//  UINavigationControllerExtension.swift
//  Mircod Practice
//
//  Created by Кирилл Королёв on 08.07.2021.
//

import Foundation
import UIKit

extension UINavigationController {
    
    func customizeNavigationController() {
        navigationBar.prefersLargeTitles = true
        navigationBar.largeTitleTextAttributes = [ NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont(name: "ProximaNova-Bold", size: 25)!]
        
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        view.backgroundColor = UIColor.clear
    }
}
