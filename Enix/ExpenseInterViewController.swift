//
//  ExpenseInterViewController.swift
//  Enix
//
//  Created by Admin on 11/10/2021.
//  Copyright © 2021 MNBD. All rights reserved.
//

import UIKit

class ExpenseInterViewController: UIViewController {

    @IBOutlet weak var foodBtn: UIButton!
    
    @IBOutlet weak var personalBtn: UIButton!
    
    @IBOutlet weak var stuffBtn: UIButton!
    
    @IBOutlet weak var subscribtionsBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "food"{
            let destinationController = segue.destination as! ExpenseViewController
            destinationController.category = String(foodBtn.titleLabel!.text!)
        }   else if segue.identifier == "personal"{
            let destinationController = segue.destination as! ExpenseViewController
            destinationController.category = String(personalBtn.titleLabel!.text!)
        }   else if segue.identifier == "stuff"{
            let destinationController = segue.destination as! ExpenseViewController
            destinationController.category = String(stuffBtn.titleLabel!.text!)
        }   else if segue.identifier == "subscribtion"{
            let destinationController = segue.destination as! ExpenseViewController
            destinationController.category = String(subscribtionsBtn.titleLabel!.text!)
        }else {}
    }

}
