//
//  RegistrationViewController.swift
//  Mircod Practice
//
//  Created by Кирилл Королёв on 05.07.2021.
//

import UIKit

class RegistrationViewController: UIViewController {

    private var registrationView: RegistrationView!
    private var networkManager: NetworkManager!
    
    override func viewDidLoad() {
        networkManager = NetworkManager()
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
        
        registrationView.nextButton.addTarget(self, action: #selector(nextButtonDidPressed),
                                              for: .touchUpInside)
        registrationView.backButton.addTarget(self, action: #selector(backButtonDidPressed),
                                              for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc
    private func nextButtonDidPressed() {
        
        let dialogView = DialogView(options: .loadingStack)
        dialogView.delegate = self
        view.addSubview(dialogView)
        
        dialogView.snp.makeConstraints { make in
            make.center.width.height.equalToSuperview()
        }
        
        networkManager.postUserRegistration(login: registrationView.loginTextField.text!,
                                            password: registrationView.passwordTextField.text!,
                                            firstName: registrationView.firstNameTextField.text!,
                                            lastName: registrationView.secondNameTextField.text!) { response, error in
            if let error = error {
                print(error)
                DispatchQueue.main.async {
                    dialogView.setTitle(text: "Error")
                    dialogView.setMessage(text: error)
                    dialogView.setImage(image: #imageLiteral(resourceName: "failedState"))
                    dialogView.setupHidden(options: .failedStack)
                }
            }
            if let response = response {
                print(response)
                DispatchQueue.main.async {
                    dialogView.setTitle(text: "Registration Success")
                    dialogView.setupType(options: .successStack)
                }
                
            }
        }
    }
    
    @objc
    private func dialogButtonDidPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    @objc
    private func backButtonDidPressed() {
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.popToRootViewController(animated: true)
    }
}
extension RegistrationViewController: DialogViewDelegate {
    
    func didPressColoredNextButton(from dialogView: DialogView) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func didPressCancelButton(from dialogView: DialogView) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func didPressColoredBackButton(from dialogView: DialogView) {
        dialogView.removeFromSuperview()
    }
}
