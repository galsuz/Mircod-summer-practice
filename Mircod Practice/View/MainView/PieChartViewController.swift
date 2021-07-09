//
//  PieChartViewController.swift
//  Mircod Practice
//
//  Created by Алсу Гиниятуллина  on 08.07.2021.
//

import UIKit

enum PieState: String {

    case  lowState, hightState, defaultState, normalState
    
    func displayImage() -> String {
        switch self {
        case .lowState:
            return "lowState"
        case .hightState:
            return "highState"
        case .defaultState:
            return "defaultState"
        case .normalState:
            return "normalState"
        }
    }
}

class PieChartView: UIView {
    
    var temperature: Float = 39.1
    
    let pieChartImage = UIImageView()
    let celsiusLabel = UILabel()
    var temperatureLabel = UILabel()
    let batteryImageView = UIImageView()
    
    func configureImageView() {
        configurePieChart()
        configureTemperatureLabel()
        configureCelsiusLabel()
        //addSubview(temperatureLabel)
        batteryImageView.image = #imageLiteral(resourceName: "icon7")
        addSubview(pieChartImage)
        addSubview(celsiusLabel)
        addSubview(temperatureLabel)
        addSubview(batteryImageView)
        initConstraint()
    }
    
    func initConstraint() {
        
        pieChartImage.snp.makeConstraints { make in
            
            make.centerX.centerY.equalToSuperview()
        }
        
        temperatureLabel.snp.makeConstraints { make in
            
            make.center.equalToSuperview()
        }
        
        celsiusLabel.snp.makeConstraints { make in

            make.top.equalToSuperview().inset(80)
            make.bottom.equalTo(temperatureLabel.snp.top).inset(20)
            make.left.equalToSuperview().inset(152)
//            make.centerY.equalTo(temperatureLabel)
        }
        
        batteryImageView.snp.makeConstraints { make in
            
            make.top.equalTo(temperatureLabel.snp.bottom).offset(22)
            make.left.equalToSuperview().inset(162)
        }
    }
    
    func configurePieChart() {

        pieChartImage.image = UIImage(named: PieState.normalState.rawValue)
    }
    
    func configureTemperatureLabel() {
        
        temperatureLabel.text = "\(temperature)"
        temperatureLabel.font = UIFont(name: "ProximaNova-Bold", size: 31)!
        temperatureLabel.textColor = .mainBlackColor
    }
    
    func configureCelsiusLabel() {
        
        celsiusLabel.text = "Celsius"
        celsiusLabel.font = UIFont(name: "ProximaNova-Bold", size: 16)!
        celsiusLabel.textColor = .mainOrangeColor
    }
}
