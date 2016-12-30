//
//  Extensions.swift
//  Guelphlandia
//
//  Created by Fareed Quraishi on 2016-12-29.
//  Copyright © 2016 Treefrog Inc. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func alertMessage(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) {
            (a:UIAlertAction) -> Void in
        }
        alert.addAction(action)
        self.present(alert, animated: true) { }
    }
}

func dispatchMain(closure: @escaping ()->()) {
    DispatchQueue.main.async {
        closure()
    }
}

extension Date {
    func getDayOfWeek()->Int {
        let myCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        let myComponents = myCalendar.components(.weekday, from: self)
        guard let weekDay = myComponents.weekday else { return -1 }
        return weekDay
    }
}

extension UIView {
    func addDropShadow(){
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false;
        self.clipsToBounds = false;
    }
}



enum DayOfWeek {
    case Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday, NoDay
    
    func asInt() -> Int {
        switch self {
        case .Monday:
            return 0
        case .Tuesday:
            return 1
        case .Wednesday:
            return 2
        case .Thursday:
            return 3
        case .Friday:
            return 4
        case .Saturday:
            return 5
        case .Sunday:
            return 6
        case .NoDay:
            return -1
        }
    }
    
    func asString() -> String {
        switch self {
        case .Monday:
            return "Monday"
        case .Tuesday:
            return "Tuesday"
        case .Wednesday:
            return "Wednesday"
        case .Thursday:
            return "Thursday"
        case .Friday:
            return "Friday"
        case .Saturday:
            return "Saturday"
        case .Sunday:
            return "Sunday"
        case .NoDay:
            return "NoDay"
        }
    }
    
    static func fromInt(int: Int) -> DayOfWeek {
        switch int {
        case 0: return .Monday
        case 1: return .Tuesday
        case 2: return .Wednesday
        case 3: return .Thursday
        case 4: return .Friday
        case 5: return .Saturday
        case 6: return .Sunday
        default:
            return .NoDay
        }
    }
}
