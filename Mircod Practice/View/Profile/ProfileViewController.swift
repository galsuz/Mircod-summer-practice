//
//  ProfileViewController.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 03.07.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    private var profileView: ProfileView!
    
    var panelIsHidden: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.navigationBar.isHidden = true
        createProfileView()
        navigationController?.customizeNavigationController()
        navigationItem.title = "Profile"
        CAGradientLayer().makeGradientInBackgroundView(view: view)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedImage(tapGestureRecognizer:)))
        profileView.profileImageView.addGestureRecognizer(tap)
        profileView.profileImageView.isUserInteractionEnabled = true
    }
    
    private func createProfileView(){
<<<<<<< HEAD
//        navigationController?.navigationBar.isHidden = true
=======
        navigationController?.navigationBar.isHidden = true
        
>>>>>>> develop
        profileView = ProfileView()
        
        view.addSubview(profileView)
        
        profileView.snp.makeConstraints { make in
            make.center.size.equalToSuperview()
        }
        
        profileView.configureView()
        
        profileView.logoutButton.addTarget(self, action: #selector(logoutButtonDidPressed), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc
    private func logoutButtonDidPressed() {
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
            fatalError("Couldn't get SceneDelegate ")
        }
        
        UserDefaults.standard.setValue(nil, forKey: .tokenId)
        UserDefaults.standard.setValue(nil, forKey: .username)
        UserDefaults.standard.setValue(nil, forKey: .firstName)
        UserDefaults.standard.setValue(nil, forKey: .lastName)
        
        sceneDelegate.window?.rootViewController = UINavigationController(rootViewController:  LoggedOutViewController())
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    @objc
    func tappedImage(tapGestureRecognizer: UITapGestureRecognizer) {
        
        UIView.animate(withDuration: 1.5) {
            if (self.panelIsHidden) {
                self.profileView.showImageBackroundPanelView()
                self.profileView.backgroundPanelCameraButton.alpha = 1
                self.profileView.backgroundPanelGalleryButton.alpha = 1
            } else {
                self.profileView.hideImageBackroundPanelView()
                self.profileView.backgroundPanelCameraButton.alpha = 0
                self.profileView.backgroundPanelGalleryButton.alpha = 0
            }
            self.profileView.layoutIfNeeded()
            self.panelIsHidden.toggle()
        }
    }
    
}
