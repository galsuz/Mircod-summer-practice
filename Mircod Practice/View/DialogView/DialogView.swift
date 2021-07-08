//
//  DialogView.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 06.07.2021.
//

import Foundation
import UIKit

protocol DialogViewDelegate: AnyObject {
    
    func didPressColoredNextButton(from: DialogView)
    func didPressCancelButton(from: DialogView)
    func didPressColoredBackButton(from: DialogView)
}

class DialogView: UIView {
    
    weak var delegate: DialogViewDelegate?
    
    private lazy var loadingImageView = UIImageView()
    private lazy var largeTitleLabel = UILabel()
    private lazy var messageLabel = UILabel()
    private lazy var coloredNextButton = UIButton(text: "OK")
    private lazy var coloredBackButton = UIButton(text: "Retry")
    private lazy var cancelSimpleButton = UIButton(text: "Cancel connection", cellType: .underlined, width: 150)
    private lazy var dialogStackView = UIStackView(views: [loadingImageView, largeTitleLabel, messageLabel, coloredNextButton, coloredBackButton, cancelSimpleButton], spacing: 38, axis: .vertical, distribution: .equalSpacing)
    
    init(options: StructOptions) {
        super.init(frame: .zero)
        
        setupDialogStack()
        setupType(options: options)
        addTargetsForButtons()
    }
    
    private func addTargetsForButtons() {
        coloredNextButton.addTarget(self, action: #selector(didPressColoredNextButton), for: .touchUpInside)
        cancelSimpleButton.addTarget(self, action: #selector(didPressCancelButton), for: .touchUpInside)
        coloredBackButton.addTarget(self, action: #selector(didPressColoredBackButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func didPressColoredNextButton() {
        delegate?.didPressColoredNextButton(from: self)
    }
    
    @objc
    private func didPressCancelButton() {
        delegate?.didPressCancelButton(from: self)
    }
    
    @objc
    private func didPressColoredBackButton() {
        delegate?.didPressColoredBackButton(from: self)
    }
}

extension DialogView: DialogViewProtocol {
    
    func setupHidden(options: StructOptions){
        loadingImageView.isHidden = !options.contains(.loadingImageView)
        largeTitleLabel.isHidden = !options.contains(.largeTitileLabel)
        messageLabel.isHidden = !options.contains(.messageLabel)
        coloredNextButton.isHidden = !options.contains(.coloredNextButton)
        coloredBackButton.isHidden = !options.contains(.coloredBackButton)
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
        coloredNextButton.titleLabel?.text = text
    }
    
    internal func setupDialogStack() {
        
        addSubview(dialogStackView)
        backgroundColor = #colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 0.97)
        
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
    
    func setupLoadingView() {
        loadingImageView.image = #imageLiteral(resourceName: "loadingState")
        loadingImageView.rotate()
        messageLabel.text = "Please wait"
        print("loading")
    }
    
    func setupFailedView() {
        loadingImageView.image = #imageLiteral(resourceName: "failedState")
        coloredBackButton.titleLabel?.text = "Retry"
        print("failed")
    }
    
    func setupSuccessView() {
        loadingImageView.image = #imageLiteral(resourceName: "successState")
        coloredNextButton.titleLabel?.text = "Ok"
        print("success")
    }
    
    func initConstraints() {
        
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
        
        coloredNextButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
        
        coloredBackButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
    }
}
