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
        navigationController?.navigationBar.isHidden = true
        createProfileView()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        let colorTop = #colorLiteral(red: 0.8666666667, green: 0.8941176471, blue: 0.9019607843, alpha: 1).cgColor
        let colorBottom = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint(x: 0.50, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
        gradientLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0,
                                                                                     b: -1,
                                                                                     c: 1,
                                                                                     d: 0,
                                                                                     tx: 0.5,
                                                                                     ty: 1))
        // if change dx dy position on 0.5 from 0.8 etc - view will be okay
        gradientLayer.bounds = view.bounds.insetBy(dx: -0.8 * view.bounds.size.width,
                                                   dy: -0.8 * view.bounds.size.height)
        gradientLayer.position = view.center
        view.layer.sublayers?.insert(gradientLayer, at: 0)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedImage(tapGestureRecognizer:)))
        profileView.profileImageView.addGestureRecognizer(tap)
        profileView.profileImageView.isUserInteractionEnabled = true
    }
    
    private func createProfileView(){
        navigationController?.navigationBar.isHidden = true
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
        //        let window:UIWindow = UIApplication.shared.delegate!.window!!
        //        window.rootViewController = UINavigationController(rootViewController: LoggedOutViewController())
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
            fatalError("Couldn't get SceneDelegate ")
        }
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
