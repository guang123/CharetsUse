//
//  ViewController.swift
//  ChartsUse
//
//  Created by luxiguang on 15/6/29.
//  Copyright (c) 2015年 luxiguang. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //图表库链接https://github.com/danielgindi/ios-charts
        //本文摘自appcoda教程，链接http://www.appcoda.com/ios-charts-api-tutorial/?utm_source=sendy&utm_medium=email&utm_campaign=ios-charts
    }

    @IBAction func showAction(sender: AnyObject) {
        var barChartVC = BarChartViewController(nibName:"BarChartViewController", bundle:nil)
        self.navigationController?.pushViewController(barChartVC, animated: true)
    }
    @IBAction func toAction(sender: AnyObject) {
        var barChartVC = lineChartViewController(nibName:"lineChartViewController", bundle:nil)
        self.navigationController?.pushViewController(barChartVC, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

