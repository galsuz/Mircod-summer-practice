//
//  LoginNavigationController.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 02.07.2021.
//

import UIKit

class LoginNavigationController: UINavigationController {


    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackButton()
    }   
    
    private func setupBackButton(){
        navigationBar.shadowImage = UIImage()
        navigationBar.backIndicatorImage = #imageLiteral(resourceName: "Union")
        navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "Union")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        
    }

}
