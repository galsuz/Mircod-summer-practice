//
//  DialogView.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 06.07.2021.
//

import Foundation
import UIKit

protocol DialogViewDelegate: AnyObject {
    
    func didPressColoredButton(from: DialogView)
    func didPressCancelButton(from: DialogView)
}

class DialogView: UIView {
    
    weak var delegate: DialogViewDelegate?
    
    private lazy var loadingImageView = UIImageView()
    private lazy var largeTitleLabel = UILabel()
    private lazy var messageLabel = UILabel()
    private lazy var coloredButton = UIButton(text: "OK")
    private lazy var cancelSimpleButton = UIButton(text: "Cancel connection", cellType: .underlined, width: 150)
    private lazy var dialogStackView = UIStackView(views: [loadingImageView, largeTitleLabel, messageLabel, coloredButton, cancelSimpleButton], spacing: 38, axis: .vertical, distribution: .equalSpacing)
    
    init(options: StructOptions) {
        super.init(frame: .zero)
        
        setupDialogStack()
        setupType(options: options)
        addTargetsForButtons()
    }
    
    private func addTargetsForButtons() {
        coloredButton.addTarget(self, action: #selector(didPressColoredButton), for: .touchUpInside)
        cancelSimpleButton.addTarget(self, action: #selector(didPressCancelButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func didPressColoredButton() {
        delegate?.didPressColoredButton(from: self)
    }
    
    @objc
    private func didPressCancelButton(){
        delegate?.didPressCancelButton(from: self)
    }
}

extension DialogView: DialogViewProtocol {
    
    func setupHidden(options: StructOptions){
        loadingImageView.isHidden = !options.contains(.loadingImageView)
        largeTitleLabel.isHidden = !options.contains(.largeTitileLabel)
        messageLabel.isHidden = !options.contains(.messageLabel)
        coloredButton.isHidden = !options.contains(.coloredButton)
        cancelSimpleButton.isHidden = !options.contains(.cancelSimpleButton)
    }
    
    func setImage(image: UIImage) {
        loadingImageView.image = image
    }
    
    func setTitle(text: String) {
        largeTitleLabel.text = text
    }
    
    func setMessage(text: String) {
        messageLabel.text = text
    }
    
    func setColoredButton(text: String) {
        coloredButton.titleLabel?.text = text
    }
    
    internal func setupDialogStack() {
        
        addSubview(dialogStackView)
        backgroundColor = #colorLiteral(red: 0.7733864188, green: 0.7735174298, blue: 0.7733692527, alpha: 0.8)
        
        largeTitleLabel.numberOfLines = 0
        messageLabel.numberOfLines = 0
        dialogStackView.alignment = .center
        largeTitleLabel.font = UIFont(name: "ProximaNova-Bold", size: 26)
        largeTitleLabel.textAlignment = .center
        
        initConstraints()
    }
    
    func setupType(options: StructOptions) {
        DispatchQueue.main.async {
            self.setupHidden(options: options)
            switch options {
            case .loadingStack:
                self.setupLoadingView()
            case .failedStack:
                self.setupFailedView()
            case .successStack:
                self.setupSuccessView()
            default:
                return
            }
        }
    }
    
    func setupLoadingView(){
        loadingImageView.image = #imageLiteral(resourceName: "loadingState")
        loadingImageView.rotate()
        messageLabel.text = "Please wait"
        print("loading")
    }
    
    func setupFailedView(){
        loadingImageView.image = #imageLiteral(resourceName: "failedState")
        coloredButton.titleLabel?.text = "Retry"
        print("failed")
    }
    
    func setupSuccessView(){
        loadingImageView.image = #imageLiteral(resourceName: "successState")
        coloredButton.titleLabel?.text = "Ok"
        print("succes")
    }
    
    func initConstraints(){
        
        dialogStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(107)
            make.leading.trailing.equalToSuperview().inset(37)
        }
        
        loadingImageView.snp.makeConstraints { make in
            make.height.width.equalTo(71)
        }
        
        largeTitleLabel.snp.makeConstraints { make in
            make.height.equalTo(52)
            make.leading.trailing.equalToSuperview()
        }
        
        messageLabel.snp.makeConstraints { make in
            make.height.equalTo(38)
        }
        coloredButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
    }
}


struct StructOptions: OptionSet {
    let rawValue: Int
    
    static let loadingImageView = StructOptions(rawValue: 1 << 0)
    static let largeTitileLabel = StructOptions(rawValue: 1 << 1)
    static let messageLabel = StructOptions(rawValue: 1 << 2)
    static let coloredButton = StructOptions(rawValue: 1 << 3)
    static let cancelSimpleButton = StructOptions(rawValue: 1 << 4)
    
    static let loadingStack: StructOptions = [.loadingImageView,
                                              .largeTitileLabel,
                                              .messageLabel]
    static let failedStack: StructOptions = [.loadingImageView,
                                             .largeTitileLabel,
                                             .messageLabel,
                                             .coloredButton,
                                             .cancelSimpleButton]
    static let successStack: StructOptions = [.loadingImageView,
                                              .largeTitileLabel,
                                              .coloredButton]
    
    static let all: StructOptions = [.loadingImageView,
                                     .largeTitileLabel,
                                     .messageLabel,
                                     .coloredButton,
                                     .cancelSimpleButton]
    
}
