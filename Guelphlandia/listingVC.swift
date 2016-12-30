//
//  listing.swift
//  Guelphlandia
//
//  Created by Fareed Quraishi on 2016-12-29.
//  Copyright © 2016 Treefrog Inc. All rights reserved.
//

import UIKit

class listingVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertMessage(title: "Look Mom", message: "\(Date().getDayOfWeek())")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deals.count + 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as? headerCell else { return UITableViewCell() }
            cell.background.addDropShadow()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "dealCell", for: indexPath)
            cell.textLabel?.text = deals[indexPath.row - 1].offering
            return cell
        }
        
    }
}
