//
//  dataLayer.swift
//  Guelphlandia
//
//  Created by FareedQ on 2017-01-10.
//  Copyright © 2017 Treefrog Inc. All rights reserved.
//

//This layer get the data from Core Data into the Data Models

import CoreData

struct dataLayer {
    
    static func loadDeal(serverId:String) -> Deal {
        
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
    
    static func loadDeals(dayOfWeek: String) -> [(String,String)] {
        var listOfDeals = [(String,String)]()
        
        let fetchRequest: NSFetchRequest<Deals> = Deals.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "dayOfWeek = %@", dayOfWeek)
        
        do {
            let searchResults = try getContext().fetch(fetchRequest)
            
            for trans in searchResults as [NSManagedObject] {
                let deal = ("\(trans.value(forKey: "offering")!)","\(trans.value(forKey: "serverId")!)")
                listOfDeals.append(deal)
            }
        } catch {
            print("Error with request: \(error)")
        }
        
        return listOfDeals
    }
}
