//
//  LoginViewController.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 02.07.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var loginView: LoginView!
    private var networkManager: NetworkManager!
    
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
    private func logInButtonDidPressed() {
        
        let dialogView = DialogView(options: .loadingStack)
        dialogView.delegate = self
        
        view.addSubview(dialogView)
        
        dialogView.snp.makeConstraints { make in
            make.center.height.width.equalToSuperview()
        }
        
        networkManager.postUserLogin(login: loginView.loginTextField.text!,
                                     password: loginView.passwordTextField.text!) { userData, error in
            if let error = error {
                print(error)
                DispatchQueue.main.async {
                    dialogView.setTitle(text: "Error")
                    dialogView.setMessage(text: error)
                    dialogView.setImage(image: #imageLiteral(resourceName: "failedState"))
                    dialogView.setupHidden(options: .failedStack)
                }
            }
            if let userData = userData {
                print(userData)
                DispatchQueue.main.async {
                    dialogView.setTitle(text: "Login Success")
                    dialogView.setupType(options: .successStack)
                }
                
            }
        }
    }
    
    @objc
    private func pushToTabBarController() {
        
        let customTabBarController = CustomTabBarController()
    
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.pushViewController(customTabBarController, animated: true)
    }

    @objc
    private func backButtonDidPressed() {
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension LoginViewController: DialogViewDelegate {
    
    func didPressColoredNextButton(from dialogView: DialogView) {
        let customTabBarController = CustomTabBarController()
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.pushViewController(customTabBarController, animated: true)
    }
    
    func didPressCancelButton(from dialogView: DialogView) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func didPressColoredBackButton(from dialogView: DialogView) {
        dialogView.removeFromSuperview()
    }
}
