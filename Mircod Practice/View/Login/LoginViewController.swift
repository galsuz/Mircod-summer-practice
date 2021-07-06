//
//  LoginViewController.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 02.07.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var loginView: LoginView!
    var networkManager: NetworkManager!
    
    override func viewDidLoad() {
        networkManager = NetworkManager()
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
        networkManager.getUserLogin(login: loginView.loginTextField.text!, password: loginView.passwordTextField.text!) { userData, error in
            if let error = error {
                print(error)
            }
            if let userData = userData {
                print(userData)
            }
        }
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.pushViewController(customTabBarController, animated: true)
    }
}
