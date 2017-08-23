//
//  DateFormatter+Extensions.swift
//  Westeros
//
//  Created by jose luis sanchez-porro godoy on 27/07/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//


import Foundation

extension Date {
    
    static func stringToDate(dateString: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-mm-yyyy"
        return formatter.date(from: dateString)!
    }
    
    static func dateToString(date: Date)-> String?{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-mm-yyyy"
        let dateString = dateFormatter.string(from:date as Date)
        return dateString
        
    }
}

