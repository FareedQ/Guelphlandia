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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let deal = loadDeal(serverId: givenServerId)
        print(deal.offering)
        
    }
    
}
