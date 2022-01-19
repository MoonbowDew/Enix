//
//  IncomeViewController.swift
//  Enix
//
//  Created by Admin on 29/09/2021.
//  Copyright © 2021 MNBD. All rights reserved.
//

import UIKit
import CoreData

class IncomeViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    
    var workings:String = ""
    
    var category:String = "Category"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Income screen"
        clearAll()
            }
            
            func clearAll()
            {
                workings = ""
                result.text = ""
            }
            
            func addToWorkings(value: String)
            {
                workings = workings + value
                result.text = workings
            }
            
            @IBAction func addTap(_ sender: Any) {

                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
                let entity = NSEntityDescription.entity(forEntityName: "Income", in: context)
                let newIncome = Income(entity: entity!, insertInto: context)
                //newExpense.id = NSNumber(Result.text)
                newIncome.work = "0"
                newIncome.other = "0"
                newIncome.commission = "0"
                newIncome.photo = "0"
                newIncome.time = NSNumber(value: Date().timeIntervalSinceReferenceDate)
                
                if category == "Work" {
                    print("IT WAS WORK")
                    newIncome.work = workings
                } else if category == "Other" {
                    print("IT WAS OTHER")
                    newIncome.other = workings
                } else if category == "Commission" {
                    print("IT WAS COMMISSION")
                newIncome.commission = workings
                } else { print("IT WAS PHOTO")
                    print(category)
                    newIncome.photo = workings}
                
                do
                {
                    try context.save()
                    incomeList.append(newIncome)
                    navigationController?.popViewController(animated: true)
                }
                catch
                {
                    print("context save error")
                }
            }

            
            @IBAction func clearTap(_ sender: Any) {
                if(!workings.isEmpty)
                {
                    workings.removeLast()
                    result.text = workings
                }
            }
            
            @IBAction func zeroTap(_ sender: Any) {
                addToWorkings(value: "0")
            }
            
            @IBAction func oneTap(_ sender: Any) {
                addToWorkings(value: "1")
                
            }

            @IBAction func twoTap(_ sender: Any) {
                addToWorkings(value: "2")
            }
            
            @IBAction func threeTap(_ sender: Any) {
                addToWorkings(value: "3")
            }
            
            @IBAction func fourTap(_ sender: Any) {
                addToWorkings(value: "4")
            }
            
            @IBAction func fiveTap(_ sender: Any) {
                addToWorkings(value: "5")
            }
            
            @IBAction func sixTap(_ sender: Any) {
                addToWorkings(value: "6")
            }
            
            @IBAction func sevenTap(_ sender: Any) {
                addToWorkings(value: "7")
            }
            
            @IBAction func eightTap(_ sender: Any) {
                addToWorkings(value: "8")
            }
            
            @IBAction func nineTap(_ sender: Any) {
                addToWorkings(value: "9")
            }
            
        }
