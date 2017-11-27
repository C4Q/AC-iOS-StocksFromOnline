//
//  Stock.swift
//  GettingDataFromOnline
//
//  Created by C4Q  on 11/27/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

struct Stock: Codable {
    let symbol: String
    let companyName: String
    let CEO: String
    let exchange: String
    let description: String
    static let defaultStock = Stock(symbol: "DEF", companyName: "No company", CEO: "No CEO", exchange: "No exchange", description: "No description")
}
