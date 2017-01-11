//
//  listing.swift
//  Guelphlandia
//
//  Created by Fareed Quraishi on 2016-12-29.
//  Copyright © 2016 Treefrog Inc. All rights reserved.
//

import UIKit
import CoreData

class listingVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var daysDeals = [(String,String)]()
    var nameOfDay = String()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        daysDeals = dataLayer.loadDeals(dayOfWeek: "\(Date().getDayOfWeek())")
        nameOfDay = DayOfWeek.fromInt(int: Date().getDayOfWeek()).asString()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daysDeals.count + 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as? headerCell else { return UITableViewCell() }
            cell.background.backgroundColor = colours.orange
            cell.background.addDropShadow()
            cell.lblTitle.text = nameOfDay
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "dealCell", for: indexPath)
            cell.textLabel?.text = daysDeals[indexPath.row - 1].0
            cell.accessoryType = .disclosureIndicator
            return cell
        }
    
    }
    
    var selectedIndex = 0
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "details", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? dealDetailVC {
            destination.givenServerId = daysDeals[selectedIndex - 1].1
        }
    }
    
    @IBAction func changeDay(_ sender: Any) {
        view.endEditing(true)
        let title = "Select your Province or Territory"
        let alertController = UIAlertController(title: nil, message: title, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in }
        alertController.addAction(cancelAction)
        
        for i in 0...6 {
            let action = UIAlertAction(title: DayOfWeek.fromInt(int: i).asString(), style: .default) { (action) in
                self.nameOfDay = DayOfWeek.fromInt(int: i).asString()
                self.daysDeals = dataLayer.loadDeals(dayOfWeek: "\(i)")
                self.tableView.reloadData()
            }
            alertController.addAction(action)
        }
        
        self.present(alertController, animated: true) {
        }
    }
}
