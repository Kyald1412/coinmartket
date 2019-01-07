//
//  ViewController.swift
//  CoinMarket
//
//  Created by Hoang on 1/7/19.
//  Copyright © 2019 Firestak. All rights reserved.
//

import UIKit

class CoinsViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!

    // Properties
    var viewModel: CoinsViewModel = CoinsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.registerCellWithIdentifier(identifier: CoinViewCell.name())
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableView.automaticDimension
    }

}

extension CoinsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numerOfItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CoinViewCell.name(), for: indexPath) as! CoinViewCell
        cell.setCoinInfo(self.viewModel.itemAtIndex(indexPath.row))
        return cell
    }
}
