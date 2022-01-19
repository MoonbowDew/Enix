import Charts
import UIKit
import CoreData



class ThirdViewController: UIViewController {
    
    
    
    var upperBound : Double = 0.0
    var lowerBound : Double = 0.0

    //@IBOutlet weak var monthBtn: UIButton!
    

    @IBOutlet weak var fromTxtField: UITextField!
    
    @IBOutlet weak var toTxtField: UITextField!
    
    let datePicker = UIDatePicker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Income Chart"
        

        
        createChart(0.0, Date().timeIntervalSinceReferenceDate) // last 20 years
        createDatePickerFrom()
        createDatePickerTo()
        // Do any additional setup after loading the view.

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
    

    
    private func createChart(_ seconds: Double, _ lowerBound: Double) {
        let barChart = BarChartView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
    
        var sumCommission: Int = 0
        var sumOther: Int = 0
        var sumPhoto: Int = 0
        var sumWork: Int = 0
        for x in 0..<incomeList.count
        {
            
            
            var tmp: String? = incomeList[x].commission
            if(tmp != nil){
            var tmpInt: Int? = Int(tmp!)
            
                var tmpTime: Double? = Double(incomeList[x].time)
                //if(Date().timeIntervalSinceReferenceDate - tmpTime! < seconds)
                if(tmpTime! > seconds && tmpTime! < lowerBound)
                {
                    sumCommission = sumCommission + tmpInt!
                }
            
            
            }
        }
        
        for x in 0..<incomeList.count
        {
            
            
            var tmp: String? = incomeList[x].other
            if(tmp != nil){
            var tmpInt: Int? = Int(tmp!)
                
                var tmpTime: Double? = Double(incomeList[x].time)
                //if(Date().timeIntervalSinceReferenceDate - tmpTime! < seconds)
                if(tmpTime! > seconds && tmpTime! < lowerBound)
                {
                    sumOther = sumOther + tmpInt!
                }
                
            
            }
        }
        
        for x in 0..<incomeList.count
        {
            
            
            var tmp: String? = incomeList[x].photo
            if(tmp != nil){
            var tmpInt: Int? = Int(tmp!)
                
                var tmpTime: Double? = Double(incomeList[x].time)
                //if(Date().timeIntervalSinceReferenceDate - tmpTime! < seconds)
                if(tmpTime! > seconds && tmpTime! < lowerBound)
                {
                    sumPhoto = sumPhoto + tmpInt!
                }
                
            
            }
        }
        
        for x in 0..<incomeList.count
        {
            
            
            var tmp: String? = incomeList[x].work
            if(tmp != nil){
            var tmpInt: Int? = Int(tmp!)
                
                var tmpTime: Double? = Double(incomeList[x].time)
                //if(Date().timeIntervalSinceReferenceDate - tmpTime! < seconds)
                if(tmpTime! > seconds && tmpTime! < lowerBound)
                {
                    sumWork = sumWork + tmpInt!
                }
                
            
            }
        }
        
        
        
        let xAxis = barChart.xAxis
        let rightAxis = barChart.rightAxis
        
        let legend = barChart.legend
        
        barChart.rightAxis.axisMinimum = 0
        barChart.leftAxis.axisMinimum = 0

        var entries1 = [BarChartDataEntry]()
        var entries2 = [BarChartDataEntry]()
        var entries3 = [BarChartDataEntry]()
        var entries4 = [BarChartDataEntry]()
        

            entries1.append(
                BarChartDataEntry(
                    x: Double(1),
                    y: Double(sumCommission)
                )
            )
            entries2.append(
                BarChartDataEntry(
                    x: Double(2),
                    y: Double(sumOther)
                )
            )
            entries3.append(
                BarChartDataEntry(
                    x: Double(3),
                    y: Double(sumPhoto)
                )
            )
            entries4.append(
                BarChartDataEntry(
                    x: Double(4),
                    y: Double(sumWork)
                )
            )

        let set1 = BarChartDataSet(entries: entries1, label: "Commission")
        set1.colors = [
            NSUIColor(cgColor: UIColor.systemBlue.cgColor)
        ]
        let set2 = BarChartDataSet(entries: entries2, label: "Other")
        set2.colors = [NSUIColor(cgColor: UIColor.systemGreen.cgColor)]
        let set3 = BarChartDataSet(entries: entries3, label: "Photo")
        set3.colors = [NSUIColor(cgColor: UIColor.systemPurple.cgColor)]
        let set4 = BarChartDataSet(entries: entries4, label: "Work")
        set4.colors = [NSUIColor(cgColor: UIColor.systemRed.cgColor)]
        
        let data = BarChartData(dataSets: [set1, set2, set3, set4])
        
        barChart.data = data
        
        view.addSubview(barChart)
        barChart.center = view.center
        
        
    }
    
//    @IBAction func calculateMonth(_ sender: Any) {
//        view.subviews.last?.removeFromSuperview()
//
//        createChart(Date().timeIntervalSinceReferenceDate - 2592000, Date().timeIntervalSinceReferenceDate)
//    }
        

}


