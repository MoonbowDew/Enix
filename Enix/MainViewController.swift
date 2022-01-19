//
//  MainViewController.swift
//  Enix
//
//  Created by Admin on 29/09/2021.
//  Copyright © 2021 MNBD. All rights reserved.
//

import UIKit
import CoreData

var expenseList = [Expense]()
var incomeList = [Income]()



var firstLoad = true

class MainViewController: UIViewController {

    @IBOutlet weak var Chart: UIImageView!
    
    @IBOutlet weak var GoToChart: UIButton!
    
    //@IBOutlet weak var tblView: UITableView!

    
    
    @IBOutlet weak var btnDrop: UIButton!
    
    var fruitList = ["Food", "Subscribtions", "Stuff", "Personal", "Commission", "Other", "Photo", "Work"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(firstLoad)
        {

            firstLoad = false
            print("I got here")
            print(firstLoad)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
            let requestEx = NSFetchRequest<NSFetchRequestResult>(entityName: "Expense")
            let requestIn = NSFetchRequest<NSFetchRequestResult>(entityName: "Income")
            do {
                let resultsEx:NSArray = try context.fetch(requestEx) as NSArray
                for resultEx in resultsEx
                {
                    let note = resultEx as! Expense
                    expenseList.append(note)
                }
                
                let resultsIn:NSArray = try context.fetch(requestIn) as NSArray
                for resultIn in resultsIn
                {
                    let note = resultIn as! Income
                    incomeList.append(note)
                }
            }
            catch
            {
                print("Fetch Failed")
            }
            

            
        }
        
        title = "Main screen"
        GoToChart.setImage( UIImage(named: "Chart.png"), for: .normal)
        //tblView.isHidden = true
        // Do any additional setup after loading the view.
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "segue"{
            let destinationController = segue.destination as! ExpenseViewController
            destinationController.category = String(btnDrop.titleLabel!.text!)
        }   else if segue.identifier == "segueIncome"{
            let destinationController = segue.destination as! IncomeViewController
            destinationController.category = String(btnDrop.titleLabel!.text!)
        } else {}
    }
    
//    @IBAction func onClickDropButton(_ sender: Any) {
//
//
//        if tblView.isHidden {
//             animate(toogle: true)
//        } else {
//            animate(toogle: false)
//        }
//    }
//
//
//    func animate(toogle: Bool) {
//
//        if toogle {
//                   UIView.animate(withDuration: 0.3) {
//                       self.tblView.isHidden = false
//                   }
//               } else {
//                   UIView.animate(withDuration: 0.3) {
//                       self.tblView.isHidden = true
//                   }
//               }
//
//    }
//}
//
//    extension MainViewController: UITableViewDelegate, UITableViewDataSource {
//         func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//             return fruitList.count
//         }
//
//         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//             let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//             cell.textLabel?.text = fruitList[indexPath.row]
//
//
//             return cell
//         }
//
//        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//             btnDrop.setTitle("\(fruitList[indexPath.row])", for: .normal)
//
////            let controller =
////                storyboard?.instantiateViewController(identifier:
////            "SecondVC") as! ExpenseViewController
////            controller.category = String(btnDrop.titleLabel!.text!)
//
//             animate(toogle: false)
//         }
    }
