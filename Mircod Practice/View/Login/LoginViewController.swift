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
        navigationController?.navigationBar.isHidden = true
        super.viewDidLoad()
        view.backgroundColor = .white
        createLoginView()
    }
    
    private func createLoginView(){
        loginView = LoginView()
        loginView.frame = view.frame
        view.addSubview(loginView)
        loginView.configureView()
        
        loginView.backButton.addTarget(self, action: #selector(backButtonDidPressed), for: .touchUpInside)
        
        loginView.logInButton.addTarget(self, action: #selector(logInButtonDidPressed), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc
    private func logInButtonDidPressed(){
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

    @objc
    private func backButtonDidPressed() {
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.popToRootViewController(animated: true)
    }
}
