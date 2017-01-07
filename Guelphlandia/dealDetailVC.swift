//
//  dealDetail.swift
//  Guelphlandia
//
//  Created by FareedQ on 2017-01-07.
//  Copyright © 2017 Treefrog Inc. All rights reserved.
//

import UIKit

class dealDetailVC : UIViewController {
    
    @IBOutlet weak var serverId: UILabel!
    var givenServerId = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serverId.text = givenServerId
    }
    
}
