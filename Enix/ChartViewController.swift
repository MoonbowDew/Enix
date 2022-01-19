////
////  ChartViewController.swift
////  Enix
////
////  Created by Admin on 03/10/2021.
////  Copyright © 2021 MNBD. All rights reserved.
////
//
//import Charts
//import UIKit
//import CoreData
//
////var expenseList = [Expense]()
////var incomeList = [Income]()
//
//class ChartViewController: UIViewController {
//    
//    var firstLoad = true
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Chart screen"
//        createChart()
//        // Do any additional setup after loading the view.
//    }
//    
//    private func createChart() {
//        let barChart = BarChartView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
//    
//        let thisNote: Expense!
//        //thisNote = expenseList[0]
//        var sumPersonal: Int = 0
//        var sumStuff: Int = 0
//        var sumSubscription: Int = 0
//        var sumFood: Int = 0
//        for x in 0..<expenseList.count
//        {
//            
//            //var tmp: String = expenseList[x].personal ?? "0"
//            //var tmpInt: Int? = Int(tmp)
//            
//            var tmp: String? = expenseList[x].personal
//            if(tmp != nil){
//            var tmpInt: Int? = Int(tmp!)
//            sumPersonal = sumPersonal + tmpInt!
//            }
//        }
//        
//        for x in 0..<expenseList.count
//        {
//            
//            //var tmp: String = expenseList[x].personal ?? "0"
//            //var tmpInt: Int? = Int(tmp)
//            
//            var tmp: String? = expenseList[x].stuff
//            if(tmp != nil){
//            var tmpInt: Int? = Int(tmp!)
//            sumStuff = sumStuff + tmpInt!
//            }
//        }
//        
//        for x in 0..<expenseList.count
//        {
//            
//            //var tmp: String = expenseList[x].personal ?? "0"
//            //var tmpInt: Int? = Int(tmp)
//            
//            var tmp: String? = expenseList[x].subscription
//            if(tmp != nil){
//            var tmpInt: Int? = Int(tmp!)
//            sumSubscription = sumSubscription + tmpInt!
//            }
//        }
//        
//        for x in 0..<expenseList.count
//        {
//            
//            //var tmp: String = expenseList[x].personal ?? "0"
//            //var tmpInt: Int? = Int(tmp)
//            
//            var tmp: String? = expenseList[x].food
//            if(tmp != nil){
//            var tmpInt: Int? = Int(tmp!)
//            sumFood = sumFood + tmpInt!
//            }
//        }
//        
//        
//        
//        let xAxis = barChart.xAxis
//        let rightAxis = barChart.rightAxis
//        
//        let legend = barChart.legend
//        //barChart.xAxis.labelFont = UIFont(name: "Verdana", size: 16.0)!
//        barChart.rightAxis.labelFont = UIFont(name: "Verdana", size: 16.0)!
//        //legend.font = UIFont(name: "Verdana", size: 16.0)!
//        
//        //var dda: Int = expenseList.count
//        //var ddd: String = thisNote.money ?? "0"
//        //var ccc: Double? = Double(ddd)
//        var entries1 = [BarChartDataEntry]()
//        var entries2 = [BarChartDataEntry]()
//        var entries3 = [BarChartDataEntry]()
//        var entries4 = [BarChartDataEntry]()
//        
////        for x in 0..<8
////        {
//            entries1.append(
//                BarChartDataEntry(
//                    x: Double(1),
//                    y: Double(sumFood)
//                )
//            )
//            entries2.append(
//                BarChartDataEntry(
//                    x: Double(2),
//                    y: Double(sumPersonal)
//                )
//            )
//            entries3.append(
//                BarChartDataEntry(
//                    x: Double(3),
//                    y: Double(sumSubscription)
//                )
//            )
//            entries4.append(
//                BarChartDataEntry(
//                    x: Double(4),
//                    y: Double(sumStuff)
//                )
//            )
//        //}
//        let set1 = BarChartDataSet(entries: entries1, label: "Food")
//        set1.colors = [
//            NSUIColor(cgColor: UIColor.systemBlue.cgColor)
//        ]
//        let set2 = BarChartDataSet(entries: entries2, label: "Personal")
//        set2.colors = [NSUIColor(cgColor: UIColor.systemGreen.cgColor)]
//        let set3 = BarChartDataSet(entries: entries3, label: "Subscriptions")
//        set3.colors = [NSUIColor(cgColor: UIColor.systemPurple.cgColor)]
//        let set4 = BarChartDataSet(entries: entries4, label: "Stuff")
//        set4.colors = [NSUIColor(cgColor: UIColor.systemRed.cgColor)]
//        
//        let data = BarChartData(dataSets: [set1, set2, set3, set4])
//        
//        barChart.data = data
//        
//        view.addSubview(barChart)
//        barChart.center = view.center
//    }
//    
//
//
//}
//
