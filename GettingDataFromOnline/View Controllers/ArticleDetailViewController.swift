//
//  ArticleDetailViewController.swift
//  GettingDataFromOnline
//
//  Created by C4Q  on 11/27/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ArticleDetailViewController: UIViewController {

    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    
    var article: Article!
    var relatedArticles: [String] {
        return article.related.components(separatedBy: ",")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headlineLabel.text = article.headline
        sourceLabel.text = article.source
        dateLabel.text = article.datetime
        summaryTextView.text = article.summary
        tableView.dataSource = self
    }
}

extension ArticleDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return relatedArticles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Related Article Cell", for: indexPath)
        let relatedArticle = relatedArticles[indexPath.row]
        cell.textLabel?.text = relatedArticle
        return cell
    }
}
