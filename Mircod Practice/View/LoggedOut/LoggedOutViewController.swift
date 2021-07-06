//
//  LoggedOutViewController.swift
//  Mircod Practice
//
//  Created by Кирилл Королёв on 05.07.2021.
//

import UIKit

class LoggedOutViewController: UIViewController {
    
    private var loggedOutView: LoggedOutView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        settupViews()
    }
    
    func settupViews() {
        view.backgroundColor = .white
        createLoggedOutView()
    }
    
    func createLoggedOutView() {
        loggedOutView = LoggedOutView()
        loggedOutView.frame = view.frame
        
        view.addSubview(loggedOutView)
        
        loggedOutView.configureView()
        
        loggedOutView.logInButton.addTarget(self, action: #selector(logInButtonDidPressed), for: .touchUpInside)
        loggedOutView.registerButton.addTarget(self, action: #selector(registerButtonDidPressed), for: .touchUpInside)
    }
    // MARK: - Actions
    @objc
    private func logInButtonDidPressed() {
        let loginViewController = LoginViewController()
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    @objc
    private func registerButtonDidPressed() {
        print(#function)
    }
}
