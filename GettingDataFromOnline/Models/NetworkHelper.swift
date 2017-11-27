//
//  NetworkHelper.swift
//  GettingDataFromOnline
//
//  Created by C4Q  on 11/27/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class NetworkHelper {
    private init() {}
    static let manager = NetworkHelper()
    let urlSession = URLSession(configuration: URLSessionConfiguration.default)
    func performDataTask(with url: URL, completionHandler: @escaping ((Data) -> Void), errorHandler: @escaping ((Error) -> Void)) {
        self.urlSession.dataTask(with: url){(data: Data?, response: URLResponse?, error: Error?) in
            DispatchQueue.main.async {
                guard let data = data else {
                    return
                }
                if let error = error {
                    errorHandler(error)
                }
                completionHandler(data)
            }
            }.resume()
    }
}
