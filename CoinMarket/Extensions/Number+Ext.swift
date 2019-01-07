//
//  Number+Ext.swift
//  CoinMarket
//
//  Created by Hoang on 1/7/19.
//  Copyright © 2019 Firestak. All rights reserved.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
