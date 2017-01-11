//
//  dealDetail.swift
//  Guelphlandia
//
//  Created by FareedQ on 2017-01-07.
//  Copyright © 2017 Treefrog Inc. All rights reserved.
//

import UIKit

class dealDetailVC : UIViewController {
    
    var givenServerId = String()
    
    @IBOutlet weak var lblDayOfWeek: UILabel!
    @IBOutlet weak var lblVenue: UILabel!
    @IBOutlet weak var lblDetails: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let deal = dataLayer.loadDeal(serverId: givenServerId)
        lblDayOfWeek.text = deal.dayOfWeek.asString()
        lblVenue.text = deal.venue
        lblDetails.text = "\(deal.price)\n\(deal.offering)\n\(deal.time)"
        print(deal.offering)
        
    }
    
}
