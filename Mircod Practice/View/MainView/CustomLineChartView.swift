//
//  CustomLineChartView.swift
//  Mircod Practice
//
//  Created by Алсу Гиниятуллина  on 07.07.2021.
//

import UIKit
import Charts

class CustomLineChartView: UIView {
    
    lazy var lineChartView = LineChartView()
    lazy var dataLabel = UILabel()
    lazy var rightButton = UIButton()
    lazy var leftButton = UIButton()
    
    func configureView() {
        configureLineChart()
        infoChart()
        addSubview(dataLabel)
        addSubview(leftButton)
        addSubview(rightButton)
        addSubview(lineChartView)
        initConstraint()
    }
    
    func initConstraint() {
        
        dataLabel.snp.makeConstraints { make in
            
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(45)
        }
        
        leftButton.snp.makeConstraints { make in
            
            make.top.equalToSuperview().inset(45)
            make.left.equalToSuperview().inset(29)
        }
        
        rightButton.snp.makeConstraints { make in
            
            make.top.equalToSuperview().inset(45)
            make.right.equalToSuperview().inset(29)
        }
        
        lineChartView.snp.makeConstraints { make in
            
            make.top.equalToSuperview().inset(86)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(213)
        }
    }
    
    private func infoChart() {
        
        dataLabel.text  = "FEBRUARY 13-19"
        dataLabel.font = UIFont(name: "ProximaNova-Bold", size: 14)
        dataLabel.textColor = .mainDarkGreyColor
        
        leftButton.setImage(#imageLiteral(resourceName: "icon6"), for: .normal)
        rightButton.setImage(#imageLiteral(resourceName: "icon5"), for: .normal)
    }
    
    private func configureLineChart() {
        
        lineChartView.backgroundColor = .white
        
        let lineChartDataSet = LineChartDataSet(entries: temperatureData)
        lineChartDataSet.drawValuesEnabled = false
        lineChartDataSet.highlightEnabled = false
        
        lineChartDataSet.circleColors = [UIColor(red: 244, green: 87, blue: 60, alpha: 0.30)]
        lineChartDataSet.circleHoleColor = .mainOrangeColor
        lineChartDataSet.colors = [.mainOrangeColor]
        
        lineChartView.rightAxis.enabled = false

        lineChartView.drawBordersEnabled = false
        
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        lineChartView.data = lineChartData

        lineChartView.legend.enabled = false
        lineChartView.xAxis.labelPosition = .bottom
        
        lineChartView.xAxis.labelFont = UIFont(name: "ProximaNova-Bold", size: 14)!
        lineChartView.leftAxis.labelFont = UIFont(name: "ProximaNova-Bold", size: 14)!
        lineChartView.xAxis.labelTextColor = .mainDarkGreyColor
        lineChartView.leftAxis.labelTextColor = .mainDarkGreyColor
        
        lineChartView.dragEnabled = false
        lineChartView.setScaleEnabled(false)
        lineChartView.pinchZoomEnabled = false
        
        lineChartView.animate(xAxisDuration: 1, yAxisDuration: 2)
        lineChartView.xAxis.drawGridLinesEnabled = true
        lineChartView.leftAxis.drawGridLinesEnabled = false
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
