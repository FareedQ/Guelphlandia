//
//  Deal.swift
//  Guelphlandia
//
//  Created by Fareed Quraishi on 2016-12-29.
//  Copyright © 2016 Treefrog Inc. All rights reserved.
//

import Foundation
import CoreData

class Deal: NSManagedObject {
    
    @NSManaged var serverId: String
    @NSManaged var dayOfWeek: Int
    @NSManaged var price: String
    @NSManaged var venue: String
    @NSManaged var time: String
    @NSManaged var offering: String
    
}
