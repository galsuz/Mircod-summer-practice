//
//  StructOptions.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 08.07.2021.
//

import Foundation

struct StructOptions: OptionSet {
    let rawValue: Int
    
    static let loadingImageView = StructOptions(rawValue: 1 << 0)
    static let largeTitileLabel = StructOptions(rawValue: 1 << 1)
    static let messageLabel = StructOptions(rawValue: 1 << 2)
    static let coloredNextButton = StructOptions(rawValue: 1 << 3)
    static let cancelSimpleButton = StructOptions(rawValue: 1 << 4)
    static let coloredBackButton = StructOptions(rawValue: 1 << 5)
    
    static let loadingStack: StructOptions = [.loadingImageView,
                                              .largeTitileLabel,
                                              .messageLabel]
    static let failedStack: StructOptions = [.loadingImageView,
                                             .largeTitileLabel,
                                             .messageLabel,
                                             .coloredBackButton,
                                             .cancelSimpleButton]
    static let successStack: StructOptions = [.loadingImageView,
                                              .largeTitileLabel,
                                              .coloredNextButton]
    
    static let all: StructOptions = [.loadingImageView,
                                     .largeTitileLabel,
                                     .messageLabel,
                                     .coloredNextButton,
                                     .cancelSimpleButton]
    
}
