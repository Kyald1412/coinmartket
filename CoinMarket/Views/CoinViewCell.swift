//
//  CoinViewCell.swift
//  CoinMarket
//
//  Created by Hoang on 1/7/19.
//  Copyright © 2019 Firestak. All rights reserved.
//

import UIKit

class CoinViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var coinNameLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!

    private let pinkColor = UIColor(red: 142/255.0, green: 31/255.0, blue: 82/255.0, alpha: 1)
    private let greenColor = UIColor(red: 89/255.0, green: 115/255.0, blue: 35/255.0, alpha: 1)
    private let grayColor = UIColor(red: 116/255.0, green: 117/255.0, blue: 120/255.0, alpha: 1)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        self.percentLabel.applyRoundedCorner(radius: 5)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCoinInfo(_ coin: Coin) {

        let rounded = coin.percent.rounded(toPlaces: 2)
        var precent = rounded.description
        var color = rounded >= 0.0 ? greenColor : pinkColor

        if rounded > 0.0 {
            precent = "+" + precent
            color = greenColor
        } else if rounded == 0.0 {
            precent = "0.00"
            color = grayColor
        } else {
            color = pinkColor
        }

        self.percentLabel.text = precent
        self.percentLabel.backgroundColor = color
        self.coinNameLabel.text = coin.name
    }
    
}
