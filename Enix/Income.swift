//
//  Income.swift
//  Enix
//
//  Created by Admin on 07/10/2021.
//  Copyright © 2021 MNBD. All rights reserved.
//

import CoreData

@objc(Income)
class Income: Time
{
    //@NSManaged var id: NSNumber!
    //@NSManaged var category: String!
    //@NSManaged var deletedDate: Date?
    @NSManaged var work: String!
    @NSManaged var photo: String!
    @NSManaged var commission: String!
    @NSManaged var other: String!
    //@NSManaged var time: NSNumber!
    
}
