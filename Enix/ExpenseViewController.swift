//
//  ExpenseViewController.swift
//  Enix
//
//  Created by Admin on 29/09/2021.
//  Copyright © 2021 MNBD. All rights reserved.
//

import UIKit
import CoreData

class ExpenseViewController: UIViewController {

    @IBOutlet weak var Result: UILabel!
    
    var workings:String = ""
    
    var category:String = "Category"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Expense screen"
        
        
        
        clearAll()
    }
    
    func clearAll()
    {
        workings = ""
        Result.text = ""
    }
    
    func addToWorkings(value: String)
    {
        workings = workings + value
        Result.text = workings
    }
    
    @IBAction func addTap(_ sender: Any) {

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Expense", in: context)
        let newExpense = Expense(entity: entity!, insertInto: context)
        //newExpense.id = NSNumber(Result.text)
        newExpense.personal = "0"
        newExpense.food = "0"
        newExpense.stuff = "0"
        newExpense.subscription = "0"
        newExpense.time = NSNumber(value: Date().timeIntervalSinceReferenceDate)
        
        if category == "Food" {
            print("IT WAS FOOD")
            newExpense.food = workings
            //newExpense.time = 655734631
        } else if category == "Personal" {
            print("IT WAS PERSONAL")
            newExpense.personal = workings
            //newExpense.time = 654734631
        } else if category == "Stuff" {
            print("IT WAS STUFF")
            newExpense.stuff = workings
            //newExpense.time = 653734631
        } else { print("IT WAS SUB")
            print(category)
            newExpense.subscription = workings
            //newExpense.time = 652734631
        }
        
        do
        {
            try context.save()
            expenseList.append(newExpense)
            navigationController?.popViewController(animated: true)
            let currentDateTime = Date()
            print(currentDateTime.timeIntervalSinceReferenceDate)
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
            Result.text = workings
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
