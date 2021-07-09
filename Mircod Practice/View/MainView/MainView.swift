//
//  MainView.swift
//  Mircod Practice
//
//  Created by Алсу Гиниятуллина  on 06.07.2021.
//

import UIKit

class MainView: UIView {
    
    lazy var lineChartView = CustomLineChartView()
    lazy var temperatureView = UIView()
    lazy var addDeviceButton = UIButton(text: "Add device", cellType: .underlined)
    
    var deviceConnected: Bool = false
    
    func configureView(){
        addSubviews()
        initConstraints()
    }
    
    private func addSubviews(){
        lineChartView.configureView()
        lineChartView.layer.cornerRadius = 45
        lineChartView.backgroundColor = .white
        
        addSubview(lineChartView)
        temperatureView.addSubview(addDeviceButton)
        addSubview(temperatureView)
    }
    
    private func initConstraints() {
        temperatureView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).inset(9)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(259)
        }
        
        lineChartView.snp.makeConstraints { make in
            make.top.equalTo(temperatureView.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(9)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(9)
        }
        
        addDeviceButton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
