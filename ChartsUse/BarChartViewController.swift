//
//  BarChartViewController.swift
//  ChartsUse
//
//  Created by luxiguang on 15/6/29.
//  Copyright (c) 2015年 luxiguang. All rights reserved.
//

import UIKit
import Charts

class BarChartViewController: BaseViewController,ChartViewDelegate {
    var months:[String]!//存储数据
    
    @IBOutlet weak var barChartView: BarChartView!
    override func viewDidLoad() {
        super.viewDidLoad()

        //barChartView.noDataText = "You need to provide data for the chart."
        //barChartView.noDataTextDescription = "GIVE REASON"//数据描述
        barChartView.delegate = self
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [20.0, 14.0, 16.0, 13.0, 12.0, 16.0, 14.0, 18.0, 12.0,14.0, 15.0, 14.0]
        setChart(months, values: unitsSold)

    }

    //创建表
    func setChart(dataPoints: [String], values: [Double]){
        barChartView.noDataText = "You need to provide data for the chart."
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "水位波动表")
        //chartDataSet.colors =  [UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1)]//自定义柱子颜色
        chartDataSet.colors = ChartColorTemplates.colorful()
        /*api提供柱子颜色
        
        ChartColorTemplates.liberty()
        ChartColorTemplates.joyful()
        ChartColorTemplates.pastel()
        ChartColorTemplates.colorful()
        ChartColorTemplates.vordiplom()
        */
        
        let chartData = BarChartData(xVals: months, dataSet: chartDataSet)
        barChartView.data = chartData
        barChartView.descriptionText = "这是一个描述"
        barChartView.xAxis.labelPosition = .Bottom//改变x轴标签的位置即months数据位置
        barChartView.backgroundColor = UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1)
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .EaseInBounce)//动画
        /*设置动画
        animate(xAxisDuration: NSTimeInterval, yAxisDuration: NSTimeInterval)
        animate(xAxisDuration: NSTimeInterval)
        animate(yAxisDuration: NSTimeInterval)
        在动画中还可添加可选项
        Linear
        EaseInQuad
        EaseOutQuad
        EaseInOutQuad
        EaseInCubic
        EaseOutCubic
        EaseInOutCubic
        EaseInQuart
        EaseOutQuart
        EaseInOutQuart
        EaseInQuint
        EaseOutQuint
        EaseInOutQuint
        EaseInSine
        EaseOutSine
        EaseInOutSine
        EaseInExpo
        EaseOutExpo
        EaseInOutExpo
        EaseInCirc
        EaseOutCirc
        EaseInOutCirc
        EaseInElastic
        EaseOutElastic
        EaseInOutElastic
        EaseInBack
        EaseOutBack
        EaseInOutBack
        EaseInBounce
        EaseOutBounce
        EaseInOutBounce
        */
        //添加水位警戒线
        let ll = ChartLimitLine(limit: 17.0, label: "Target")
        barChartView.rightAxis.addLimitLine(ll)
        
    }
    
    //MARK:ChartViewDelegate
    func chartValueSelected(chartView: ChartViewBase, entry: ChartDataEntry, dataSetIndex: Int, highlight: ChartHighlight) {
        println("\(entry.value) in \(months[entry.xIndex])")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func savesaveAction(button: UIButton) {
         barChartView.saveToCameraRoll()
        //barChartView.saveToPath(path: String, format: ChartViewBase.ImageFormat, compressionQuality: Double)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
