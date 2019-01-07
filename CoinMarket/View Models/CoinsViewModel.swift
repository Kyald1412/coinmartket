//
//  CoinsViewModel.swift
//  CoinMarket
//
//  Created by Hoang on 1/7/19.
//  Copyright © 2019 Firestak. All rights reserved.
//

import UIKit

class CoinsViewModel: NSObject {

    private var coins: [Coin] = []

    override init() {
        super.init()
        self.coins = self.fakeData()
    }

    private func fakeData() -> [Coin] {
        var array: [Coin] = []

        if let path = Bundle.main.path(forResource: "coins", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let jsonResult = jsonResult as? Dictionary<String, Any>, let data = jsonResult["data"] as? [[String: Any]] {
                    for item in data {
                        let coin = Coin(name: item["name"] as! String, percent: item["percent_change"] as! Double)
                        array.append(coin)
                    }
                }
            } catch {
                // handle error
                print("Parse error: \(error)")
            }
        }

        return array
    }

    // MARK: - Helpers
    var numerOfItems: Int {
        return self.coins.count
    }

    func itemAtIndex(_ index: Int) -> Coin {
        return coins[index]
    }
}
