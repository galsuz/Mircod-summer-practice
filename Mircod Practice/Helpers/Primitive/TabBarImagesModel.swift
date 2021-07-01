//
//  TabBarImagesModel.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 30.06.2021.
//

import Foundation
import UIKit

struct TabBarImagesModel {
    let homeGreyImage: UIImage = UIImage(named: "home-grey") ?? UIImage(systemName: "house")!
    let homeOrangeImage: UIImage = UIImage(named: "home-orange") ?? UIImage(systemName: "house")!
    let profileOrangeImage: UIImage = UIImage(named: "profile-orange") ?? UIImage(systemName: "person.circle")!
    let profileGreyImage: UIImage = UIImage(named: "profile-grey") ?? UIImage(systemName: "person.circle")!
    let settingsGreyImage: UIImage = UIImage(named: "settings-grey") ?? UIImage(systemName: "gear")!
    let settingsOrangeImage: UIImage = UIImage(named: "settings-orange") ?? UIImage(systemName: "gear")!
}
