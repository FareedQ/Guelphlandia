//
//  ViewController.swift
//  Guelphlandia
//
//  Created by Fareed Quraishi on 2016-12-29.
//  Copyright © 2016 Treefrog Inc. All rights reserved.
//

import UIKit
import AudioToolbox

class randomOfferingVC: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblOffering: UILabel!
    
    var seenOfferings = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeLookPretty()
    }
    
    func makeLookPretty(){
        lblTitle.textColor = colours.grey
        lblOffering.textColor = colours.grey
        lblOffering.text = "Shake phone for random thing to do"
    }
    
    
    
    //MARK: Shake, Vibrate, Random Response
    
    override var canBecomeFirstResponder : Bool {
        return true
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            lblOffering.alpha = 0
        }
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
            responseAction()
        }
    }
    
    func responseAction(){
        let randomInt = getRandomInt()
        if randomInt == -1 {
            lblOffering.text = "I have no more ideas."
        } else {
            lblOffering.text = "\(deals[randomInt].offering) at \(deals[randomInt].venue)"
        }
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.lblOffering.alpha = 1
        })
    }
    
    func getRandomInt() -> Int{
        if seenOfferings.count == deals.count {
            return -1
        }
        
        var randomInt = Int(arc4random_uniform(UInt32(deals.count)))
        while seenOfferings.contains(randomInt) {
            randomInt = Int(arc4random_uniform(UInt32(deals.count)))
        }
        seenOfferings.append(randomInt)
        return randomInt
    }


}

