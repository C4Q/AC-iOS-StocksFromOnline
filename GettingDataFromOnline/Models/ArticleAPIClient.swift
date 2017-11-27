//
//  ArticleAPIClient.swift
//  GettingDataFromOnline
//
//  Created by C4Q  on 11/27/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class ArticleAPIClient {
    private init() {}
    static let manager = ArticleAPIClient()
    func getArticles(from urlStr: String,
                     completionHandler: @escaping ([Article]) -> Void,
                     errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else {return}
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let decoder = JSONDecoder()
                let articles = try decoder.decode([Article].self, from: data)
                completionHandler(articles)
            }
            catch {
                errorHandler(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: url,
                                              completionHandler: completion,
                                              errorHandler: errorHandler)
    }
}
