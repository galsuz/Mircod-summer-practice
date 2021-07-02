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
        super.viewDidLoad()
        view.backgroundColor = .white
        createView()
    }
    
    private func createView(){
        loginView = LoginView()
        loginView.frame = view.frame
        print(loginView.frame)
        view.addSubview(loginView)
        loginView.addViews()
    }
    
}
