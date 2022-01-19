//
//  IncomeInterViewController.swift
//  Enix
//
//  Created by Admin on 11/10/2021.
//  Copyright © 2021 MNBD. All rights reserved.
//

import UIKit

class IncomeInterViewController: UIViewController {

    @IBOutlet weak var commissionBtn: UIButton!
    
    @IBOutlet weak var otherBtn: UIButton!
    
    @IBOutlet weak var photo: UIButton!
    
    @IBOutlet weak var workBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "work"{
            let destinationController = segue.destination as! IncomeViewController
            destinationController.category = String(workBtn.titleLabel!.text!)
        }   else if segue.identifier == "commission"{
            let destinationController = segue.destination as! IncomeViewController
            destinationController.category = String(commissionBtn.titleLabel!.text!)
        }   else if segue.identifier == "photo"{
            let destinationController = segue.destination as! IncomeViewController
            destinationController.category = String(photo.titleLabel!.text!)
        }   else if segue.identifier == "other"{
            let destinationController = segue.destination as! IncomeViewController
            destinationController.category = String(otherBtn.titleLabel!.text!)
        }else {}
    }

}
