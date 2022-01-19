//
//  Expense.swift
//  Enix
//
//  Created by Admin on 03/10/2021.
//  Copyright © 2021 MNBD. All rights reserved.
//

import CoreData

@objc(Expense)
class Expense: Time
{
    //@NSManaged var id: NSNumber!
    //@NSManaged var category: String!
    //@NSManaged var deletedDate: Date?
    @NSManaged var personal: String!
    @NSManaged var subscription: String!
    @NSManaged var food: String!
    @NSManaged var stuff: String!
    //@NSManaged var time: NSNumber!
    
}
