//
//  ProfileViewController.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 03.07.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    private var profileView: ProfileView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        createProfileView()
    }
    
    private func createProfileView(){
        navigationController?.navigationBar.isHidden = true
        profileView = ProfileView()
        view.addSubview(profileView)
        profileView.snp.makeConstraints { make in
            make.size.equalTo(view)
        }
        profileView.configureView()
        
        profileView.logoutButton.addTarget(self, action: #selector(logoutButtonDidPressed), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc
    private func logoutButtonDidPressed() {
        //        let window:UIWindow = UIApplication.shared.delegate!.window!!
        //        window.rootViewController = UINavigationController(rootViewController: LoggedOutViewController())
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
            fatalError("Couldn't get SceneDelegate ")
        }
        sceneDelegate.window?.rootViewController = UINavigationController(rootViewController:  LoggedOutViewController())
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.popToRootViewController(animated: true)
    }
}
