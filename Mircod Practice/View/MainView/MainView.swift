//
//  MainView.swift
//  Mircod Practice
//
//  Created by Алсу Гиниятуллина  on 06.07.2021.
//

import UIKit

class MainView: UIView {
    
    lazy var lineChartView = CustomLineChartView()
    lazy var pieChartImageView = PieChartView()
    lazy var homeLabel = UILabel()
    lazy var temperatureView = UIView()
    lazy var addDeviceButton = UIButton()
    
    var deviceConnected: Bool = false
    
    func configureView() {
        
        addSubviews()
        homeLabel.text = "Home"
        initConstraints()
        backgroundColor = .profileBackgroundColor
    }
    
    private func addSubviews(){
        addSubview(homeLabel)
        
        lineChartView.configureView()
        lineChartView.layer.cornerRadius = 45
        lineChartView.backgroundColor = .white
        addSubview(lineChartView)
        
//        addDeviceButton.setTitle("Add device", for: .normal)
//        temperatureView.addSubview(addDeviceButton)
        
        pieChartImageView.configureImageView()
        addSubview(pieChartImageView)
        
        addSubview(temperatureView)
    }
    
    private func initConstraints(){
        homeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(24)
        }
        
        pieChartImageView.snp.makeConstraints { make in
            
            make.top.equalToSuperview().inset(80)
            make.left.right.equalToSuperview().inset(30)
            make.height.width.equalTo(300)
        }
        
        
        temperatureView.snp.makeConstraints { make in
            make.top.equalTo(homeLabel.snp.bottom).offset(9)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(259)
        }
        
        lineChartView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(381)
            make.leading.trailing.equalToSuperview().inset(9)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(9)
            make.height.equalTo(339)
        }
        
//        addDeviceButton.snp.makeConstraints { make in
//            make.centerX.centerY.equalToSuperview()
//            make.width.equalTo(170)
//            make.height.equalTo(50)
//        }
    }
}
