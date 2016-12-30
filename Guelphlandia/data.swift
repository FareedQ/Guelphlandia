//
//  data.swift
//  Guelphlandia
//
//  Created by Fareed Quraishi on 2016-12-29.
//  Copyright © 2016 Treefrog Inc. All rights reserved.
//

import CoreData
import UIKit

let deals:[(serverId:String, dayOfWeek:DayOfWeek,venue:String,offering:String,price:String,time:String)] =
    [("1", .Thursday,"Western","1/2 Priced Burgers","Purchase of a Drink",""),
    ("2", .Thursday,"39 Carden","$4 Snacks and a Bottle of Wine","$50",""),
    ("3", .Thursday,"Albion","Wine, Martinis and Cocktails","$5","5 - 11"),
    ("4", .Thursday,"Albion","Gosh Damn Thursdays","","10pm - 2am"),
    ("5", .Thursday,"Jimmy Jazz","Mill Street Cans","$4","9 - 12"),
    ("6", .Thursday,"Jimmy Jazz","Jager Shots","$3","9 - 12"),
    ("7", .Thursday,"Bobby O’ Brien’s","Wings","$0.45","2-6"),
    ("8", .Thursday,"Atmosphere","Martini Special","$6","5pm - 2am"),
    ("9", .Thursday,"Atmosphere","Pints of Welly","$4","5pm - 2am"),
    ("10", .Friday,"Atmosphere","All Bourbon","$5","5pm - 2am"),
    ("11", .Friday,"Joint Cafe","Craft Beers, Mill Street, Stonehammer, SPA","$4","5pm"),
    ("12", .Friday,"Albion","Burgers","$5","4-7"),
    ("13", .Friday,"Albion","Fresh Fridays DJ","","10pm-2am"),
    ("14", .Friday,"Albion","Domestic Bottles and Well Shots","$3","9-11"),
    ("15", .Friday,"Western","Oysters","$1 each","3pm-until supplies last"),
    ("16", .Saturday,"Red Brick","Wine Bottles","$20","5pm - close"),
    ("17", .Saturday,"Bobby O Brain’s","Pitcher of Molson","$12","4-7"),
    ("18", .Saturday,"Bobby O Brain’s","Pitcher of Molson and 16 wings","$20","4-7"),
    ("19", .Saturday,"Bobby O Brain’s","Pitcher of Molson and Pizza","$20","4-7"),
    ("20", .Saturday,"Bobby O Brain’s","Pitcher of Molson and 2 Hamburgers","$20","4-7"),
    ("21", .Sunday,"Atmosphere","Creperie","","10am - 3pm"),
    ("22", .Sunday,"39 Carden","Cinco Domingo with Tallboys, Ciders, Wine, Rail Shots, Snacks","$5","9pm - close"),
    ("23", .Sunday,"39 Carden","Cinco Domingo with Oysters","$1","9pm - While Supplies Last"),
    ("24", .Sunday,"Baker St","$4","Ceasers","All day"),
    ("25", .Sunday,"Bobby","Wings","1/2 Price","All Day"),
    ("26", .Sunday,"Western","$5 off steaks","","All Day"),
    ("27", .Monday,"Baker St","Mill Street Pints","$5","All Day"),
    ("28", .Monday,"Baker St.","Wings","$9","All Day"),
    ("29", .Monday,"Diana Downtown","Thali","$10","All days"),
    ("30", .Monday,"Miijidaa","Flatbread & Wine","$15",""),
    ("31", .Monday,"39 Carden","$3 Pieces of Fried Chicken, $1 Dill Pickles, $6 Beaus","",""),
    ("32", .Monday,"Bobby’s","All you can eat wings","7pm","$11.99"),
    ("33", .Tuesday,"Diana Downtown","Thali","$10","All days"),
    ("34", .Tuesday,"Baker St Station","Deep Dish Pizza","$12","All Day"),
    ("35", .Tuesday,"Miijidaa","Burger & Pint","$15","All Day"),
    ("36", .Tuesday,"39 Carden","Tallboys & Mussels","$10",""),
    ("37", .Wednesday,"Bobby","$1 Tacos and $4 Coronas","","All day"),
    ("38", .Wednesday,"39 Carden","$27 Bottle of Wine","","All day")]

func getContext () -> NSManagedObjectContext {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    return appDelegate.persistentContainer.viewContext
}

func storeInCoreData() {
    let context = getContext()
    for deal in deals {
        guard let entity =  NSEntityDescription.entity(forEntityName: "Deals", in: context) else { return }
        
        let transc = NSManagedObject(entity: entity, insertInto: context)
        context.mergePolicy = NSMergePolicy(merge: .mergeByPropertyObjectTrumpMergePolicyType)
        
        transc.setValue(deal.serverId, forKey: "serverId")
        transc.setValue(deal.dayOfWeek.asInt(), forKey: "dayOfWeek")
        transc.setValue(deal.offering, forKey: "offering")
        transc.setValue(deal.price, forKey: "price")
        transc.setValue(deal.venue, forKey: "venue")
        transc.setValue(deal.time, forKey: "time")
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
}
