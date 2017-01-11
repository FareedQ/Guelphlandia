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

func loadDeal(serverId:String) -> Deal {
    
    let fetchRequest: NSFetchRequest<Deals> = Deals.fetchRequest()
    fetchRequest.predicate = NSPredicate(format: "serverId = %@", serverId)
    
    do {
        let searchResults = try getContext().fetch(fetchRequest)
        
        let dayOfWeek = DayOfWeek.fromInt(int: searchResults[0].value(forKey: "dayOfWeek") as! Int)
        let offering = searchResults[0].value(forKey: "offering") as! String
        let price = NSDecimalNumber(string: searchResults[0].value(forKey: "price") as? String)
        let time = searchResults[0].value(forKey: "time") as! String
        let venue = searchResults[0].value(forKey: "venue") as! String
        return Deal(dayOfWeek: dayOfWeek, offering: offering, price: price, serverId: serverId, time: time, venue: venue)
    } catch {
        print("Error with request: \(error)")
        return Deal()
    }
}
