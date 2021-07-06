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
    }
}
