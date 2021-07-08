//
//  RegistrationViewController.swift
//  Mircod Practice
//
//  Created by Кирилл Королёв on 05.07.2021.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    private var registrationView: RegistrationView!
    
    override func viewDidLoad() {
        navigationController?.navigationBar.isHidden = true
        super.viewDidLoad()
        view.backgroundColor = .white
        createRegistrationView()
    }
    
    private func createRegistrationView() {
        registrationView = RegistrationView()
        registrationView.frame = view.frame
        
        view.addSubview(registrationView)
        
        registrationView.configureView()
        
        registrationView.nextButton.addTarget(self, action: #selector(nextButtonDidPressed), for: .touchUpInside)
        
        registrationView.backButton.addTarget(self, action: #selector(backButtonDidPressed), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc
    private func nextButtonDidPressed() {
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
