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

class PieChartViewController: UIView {
    
    var temperature: Int = 10
    
    let pieChartImage = UIImageView()
    let celsiusLabel = UILabel()
    var temperatureLabel = UILabel()
    
    func configureView() {
        configurePieChart()
        addSubview(pieChartImage)
        addSubview(celsiusLabel)
        addSubview(temperatureLabel)
        initConstraint()
    }
    
    func initConstraint() {
        
        pieChartImage.snp.makeConstraints { make in
            
            make.top.bottom.left.right.equalTo(10)
        }
        
        temperatureLabel.snp.makeConstraints { make in
            
            make.center.equalToSuperview()
        }
        
        
    }
    
    func configurePieChart() {
        
        
        let pieState = PieState.hightState
        pieChartImage.image = UIImage(imageLiteralResourceName: pieState.displayImage())
    }
    
    func configureTemperatureLabel() {
        
        temperatureLabel.text = "\(temperature)"
    }
}
