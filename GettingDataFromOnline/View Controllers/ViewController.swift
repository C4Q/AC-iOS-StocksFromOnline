//
//  ViewController.swift
//  GettingDataFromOnline
//
//  Created by C4Q  on 11/27/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var CEOLabel: UILabel!
    @IBOutlet weak var exchangeLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var searchTerm = "" {
        didSet {
            loadData()
        }
    }
    
    var stock = Stock.defaultStock {
        didSet {
            setLabelsFromStock()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.delegate = self
    }
    
    func loadData() {
        let urlStr = "https://api.iextrading.com/1.0/stock/\(searchTerm)/company"
        let setStockToOnlineStock: (Stock) -> Void = {(onlineStock: Stock) in
            self.stock = onlineStock
        }
        StockAPIClient.manager.getStock(from: urlStr,
                                        completionHandler: setStockToOnlineStock,
                                        errorHandler: {print($0)})
    }

    func setLabelsFromStock() {
        nameLabel.text = stock.companyName
        CEOLabel.text = stock.CEO
        exchangeLabel.text = stock.exchange
        descriptionTextView.text = stock.description
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchTerm = searchBar.text ?? ""
        searchBar.resignFirstResponder()
    }
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ArticlesViewController {
            destination.stock = self.stock
        }
    }
}

