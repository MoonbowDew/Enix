//
//  SecondViewController.swift
//  Enix
//
//  Created by Admin on 07/10/2021.
//  Copyright © 2021 MNBD. All rights reserved.
//

import Charts
import UIKit
import CoreData


class SecondViewController: UIViewController {
    
    var firstLoad = true
    
    var upperBound : Double = 0.0
    var lowerBound : Double = 0.0

    @IBOutlet weak var fromTxtField: UITextField!
    
    @IBOutlet weak var toTxtField: UITextField!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profit Chart"
        createChart(0.0, Date().timeIntervalSinceReferenceDate) // last 20 years
        createDatePickerFrom()
        createDatePickerTo()
        // Do any additional setup after loading the view.
    }
    
    private func createChart(_ seconds: Double, _ lowerBound: Double) {
        let barChart = BarChartView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
    
        //thisNote = expenseList[0]
        var totalExpense: Int = 0;
        var totalIncome: Int = 0;
        
        for x in 0..<expenseList.count
        {
            var tmpTime: Double? = Double(expenseList[x].time)
            
            //var tmp: String = expenseList[x].personal ?? "0"
            //var tmpInt: Int? = Int(tmp)
            
            var tmpFood: String? = expenseList[x].food
            if(tmpFood != nil)
            {
            var tmpFoodInt: Int? = Int(tmpFood!)
                if(tmpTime! > seconds && tmpTime! < lowerBound)
                {totalExpense = totalExpense + tmpFoodInt!}
                
            }
            
            var tmpStuff: String? = expenseList[x].stuff
            if(tmpStuff != nil)
            {
            var tmpStuffInt: Int? = Int(tmpStuff!)
                if(tmpTime! > seconds && tmpTime! < lowerBound)
                {totalExpense = totalExpense + tmpStuffInt!}
                
            }
                    
            var tmpPersonal: String? = expenseList[x].personal
            if(tmpPersonal != nil)
            {
            var tmpPersonalInt: Int? = Int(tmpPersonal!)
                if(tmpTime! > seconds && tmpTime! < lowerBound)
                {totalExpense = totalExpense + tmpPersonalInt!}
                
            }
            
            var tmpSubscription: String? = expenseList[x].subscription
            if(tmpSubscription != nil)
            {
            var tmpSubscriptionInt: Int? = Int(tmpSubscription!)
                if(tmpTime! > seconds && tmpTime! < lowerBound)
                {totalExpense = totalExpense + tmpSubscriptionInt!}
            }
                
        }
        
        for x in 0..<incomeList.count
        {
            var tmpTime: Double? = Double(incomeList[x].time)
            //var tmp: String = expenseList[x].personal ?? "0"
            //var tmpInt: Int? = Int(tmp)
            
                
                //
                
                var tmpCommission: String? = incomeList[x].commission
                if(tmpCommission != nil)
                {
                var tmpCommissionInt: Int? = Int(tmpCommission!)
                    if(tmpTime! > seconds && tmpTime! < lowerBound)
                    {totalIncome = totalIncome + tmpCommissionInt!}
                    
                }
                
                var tmpOther: String? = incomeList[x].other
                if(tmpOther != nil)
                {
                var tmpOtherInt: Int? = Int(tmpOther!)
                    if(tmpTime! > seconds && tmpTime! < lowerBound)
                    {totalIncome = totalIncome + tmpOtherInt!}
                    
                }
                        
                var tmpPhoto: String? = incomeList[x].photo
                if(tmpPhoto != nil)
                {
                var tmpPhotoInt: Int? = Int(tmpPhoto!)
                    if(tmpTime! > seconds && tmpTime! < lowerBound)
                    {totalIncome = totalIncome + tmpPhotoInt!}
                    
                }
                
                var tmpWork: String? = incomeList[x].work
                if(tmpWork != nil)
                {
                var tmpWorkInt: Int? = Int(tmpWork!)
                    if(tmpTime! > seconds && tmpTime! < lowerBound)
                    
                    {totalIncome = totalIncome + tmpWorkInt!}
                }
        }
                
        
        
        
        
        let xAxis = barChart.xAxis
        let rightAxis = barChart.rightAxis
        
        let legend = barChart.legend
        
        barChart.rightAxis.axisMinimum = 0
        barChart.leftAxis.axisMinimum = 0
        
        var entries1 = [BarChartDataEntry]()
        var entries2 = [BarChartDataEntry]()
        
//        for x in 0..<8
//        {
            entries1.append(
                BarChartDataEntry(
                    x: Double(1),
                    y: Double(totalExpense)
                )
            )
            entries2.append(
                BarChartDataEntry(
                    x: Double(2),
                    y: Double(totalIncome)
                )
            )
        //}
        let set1 = BarChartDataSet(entries: entries1, label: "Total Expense")
        set1.colors = [
            NSUIColor(cgColor: UIColor.systemRed.cgColor)
        ]
        let set2 = BarChartDataSet(entries: entries2, label: "Total Income")
        set2.colors = [NSUIColor(cgColor: UIColor.systemGreen.cgColor)]

        
        let data = BarChartData(dataSets: [set1, set2])
        
        barChart.data = data
        
        view.addSubview(barChart)
        barChart.center = view.center
    }
    

    
    func createDatePickerFrom() {

        fromTxtField.textAlignment = .center
        // toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        // bar button
        let doneStn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedFrom))
        toolbar.setItems([doneStn], animated: true)

        // assign toolbar
        fromTxtField.inputAccessoryView = toolbar
        
        // assign date picker to the text field
        fromTxtField.inputView = datePicker
        // date picker mode
        datePicker.datePickerMode = .date
    }
    
    func createDatePickerTo() {


        toTxtField.textAlignment = .center
        
        // toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        // bar button
        let doneStn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedTo))
        toolbar.setItems([doneStn], animated: true)

        // assign toolbar
        toTxtField.inputAccessoryView = toolbar
        
        // assign date picker to the text field
        toTxtField.inputView = datePicker
        // date picker mode
        //datePicker.datePickerMode = .date
        
    }
    
    @objc func donePressedFrom() {
        // formatter
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        //formatter.dateStyle = .none
        //formatter.timeStyle = .long
        
        
        fromTxtField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
        
        print("FIND ME")
        datePicker.datePickerMode = UIDatePicker.Mode.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        let selectedDate = dateFormatter.string(from: datePicker.date)
        print(selectedDate)
        print(datePicker.date.timeIntervalSinceReferenceDate)
        upperBound = datePicker.date.timeIntervalSinceReferenceDate
        print(Date().timeIntervalSinceReferenceDate)
        
        if (toTxtField.text != "" && fromTxtField.text != "")
        {
            view.subviews.last?.removeFromSuperview()
            createChart(upperBound, lowerBound)
            print("IT DIDN'T CRASH!!!")
        }
    }
    
    
    @objc func donePressedTo() {
        // formatter
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        
        toTxtField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
        
        print("FIND ME")
        datePicker.datePickerMode = UIDatePicker.Mode.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        let selectedDate = dateFormatter.string(from: datePicker.date)
        print(selectedDate)
        print(datePicker.date.timeIntervalSinceReferenceDate)
        lowerBound = datePicker.date.timeIntervalSinceReferenceDate
        print(Date().timeIntervalSinceReferenceDate)
        
        if (toTxtField.text != "" && fromTxtField.text != "")
        {
            view.subviews.last?.removeFromSuperview()
            createChart(upperBound, lowerBound)
            print("IT DIDN'T CRASH!!!")
        }
    }

}
