//
//  LoginViewController.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 02.07.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var loginView: LoginView!
    
    override func viewDidLoad() {
        navigationController?.navigationBar.isHidden = false
        super.viewDidLoad()
        view.backgroundColor = .white
        createLoginView()
    }
    
    private func createLoginView(){
        loginView = LoginView()
        loginView.frame = view.frame
        
        view.addSubview(loginView)
        
        loginView.configureView()
        
        loginView.logInButton.addTarget(self, action: #selector(logInButtonDidPressed), for: .touchUpInside)
    }
    
    
    @objc
    private func logInButtonDidPressed(){
        print(#function)
        let customTabBarController = CustomTabBarController()
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.pushViewController(customTabBarController, animated: true)
    }
    
}
