//
//  NSObject+Ext.swift
//  CoinMarket
//
//  Created by Hoang on 1/7/19.
//  Copyright © 2019 Firestak. All rights reserved.
//

import Foundation

extension NSObject {
    class func name() -> String {
        // get class name
        let path = NSStringFromClass(self)

        return path.components(separatedBy: ".").last ?? ""
    }
}
