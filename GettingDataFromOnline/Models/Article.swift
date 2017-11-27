//
//  Article.swift
//  GettingDataFromOnline
//
//  Created by C4Q  on 11/27/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

struct Article: Codable {
    let datetime: String
    let headline: String
    let source: String
    let summary: String
    let related: String
}
