//
//  offeringDM.swift
//  Guelphlandia
//
//  Created by FareedQ on 2017-01-09.
//  Copyright © 2017 Treefrog Inc. All rights reserved.
//

import Foundation
import CoreData

struct Deal {
    
    let dayOfWeek:DayOfWeek
    let offering:String
    let price:NSDecimalNumber
    let serverId:String
    let time:String
    let venue:String
    
    init(){
        self.dayOfWeek = .Monday
        self.offering = String()
        self.price = NSDecimalNumber()
        self.serverId = String()
        self.time = String()
        self.venue = String()
    }
    
    init(dayOfWeek:DayOfWeek, offering:String, price:NSDecimalNumber, serverId:String, time:String, venue:String){
        self.dayOfWeek = dayOfWeek
        self.offering = offering
        self.price = price
        self.serverId = serverId
        self.time = time
        self.venue = venue
    }
}
