//
//  DialogViewProtocol.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 07.07.2021.
//

import Foundation
import UIKit
protocol DialogViewProtocol {
    
    func setImage(image: UIImage)
    func setTitle(text: String)
    func setMessage(text: String)
    func setColoredButton(text: String)
    
    func setupHidden(options: StructOptions)
    func setupType(options: StructOptions)
    func setupLoadingView()
    func setupFailedView()
    func setupSuccessView()
    func setupDialogStack()
    func initConstraints()
    
}
