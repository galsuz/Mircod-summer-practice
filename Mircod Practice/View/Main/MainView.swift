//
//  MainView.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 04.07.2021.
//

import UIKit
import Charts

class MainView: UIView {
    
    lazy var lineChartView = LineChartView()
    lazy var homeLabel = UILabel()
    lazy var temperatureView = UIView()
    lazy var addDeviceButton = UIButton() // Alsu task simple button
    
    func configureView(){
        addSubviews()
        configureLineChart()
        homeLabel.text = "Home"
        initConstraints()
        backgroundColor = .profileBackgroundColor
        
    }
    
    private func addSubviews(){
        addSubview(homeLabel)
        addDeviceButton.setTitle("Add device", for: .normal)
        temperatureView.addSubview(addDeviceButton)
        addSubview(temperatureView)
        addSubview(lineChartView)
    }
    
    private func initConstraints(){
        homeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(24)
        }
        
        temperatureView.snp.makeConstraints { make in
            make.top.equalTo(homeLabel.snp.bottom).offset(9)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(259)
        }
        
        lineChartView.snp.makeConstraints { make in
            make.top.equalTo(temperatureView.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(10)
            make.height.equalTo(lineChartView.snp.width)
        }
        
        addDeviceButton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(170)
            make.height.equalTo(50)
        }
    }
    // Just test Charts, need reforge
    private func configureLineChart(){
        lineChartView.backgroundColor = .white
        let lineChartDataSet = LineChartDataSet(entries: temperatureData, label: "July 5-11")
        lineChartDataSet.drawValuesEnabled = false
        lineChartDataSet.circleHoleColor = .mainOrangeColor
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        lineChartView.data = lineChartData
        lineChartView.layer.cornerRadius = 50
        lineChartView.isMultipleTouchEnabled = false
        lineChartView.isExclusiveTouch = false
        lineChartView.legend.enabled = false
        lineChartView.rightAxis.enabled = false
        lineChartView.xAxis.labelPosition = .bottom
        
    }
    
    var temperatureData: [ChartDataEntry] = [
        ChartDataEntry(x: 5, y: 25),
        ChartDataEntry(x: 6, y: 26),
        ChartDataEntry(x: 7, y: 27),
        ChartDataEntry(x: 8, y: 31),
        ChartDataEntry(x: 9, y: 32),
        ChartDataEntry(x: 10, y: 31),
        ChartDataEntry(x: 11, y: 29)
    ]
}
