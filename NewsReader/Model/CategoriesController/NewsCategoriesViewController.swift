//
//  NewsCategoriesViewController.swift
//  NewsReader
//
//  Created by alexey sorochan on 04.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class NewsCategoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var showSearchBarHeightConstraint: NSLayoutConstraint!
    
    
    
    var newsCategories: [NewsCategories] = []
    var favoriteNews: [NewsArticleModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getnews()
        newsCategories = MakeNewsCategories().makeCat()
        
        tableView.register(UINib(nibName: "CategoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoriesTableViewCell")
        tableView.register(UINib(nibName: "FavoritesTableViewCell", bundle: nil), forCellReuseIdentifier: "FavoritesTableViewCell")

        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    @IBAction func didTapShowSearchBarActionButton(_ sender: Any) {
        showSearchBarHeightConstraint.priority = UILayoutPriority(rawValue: 800)
    }
}










extension NewsCategoriesViewController {
    
    func getnews() {
        let parameters = ["q": "china virus",
                          "to": "2020-02-03",
                          "from": "2020-01-12",
                          "pageSize": 20] as [String : Any]
        
        let url = URL(string: "https://newsapi.org/v2/everything")
        if let urlCorrect = url {
            Alamofire.request(urlCorrect,
                              method: .get,
                              parameters: parameters,
                              encoding: URLEncoding.default,
                              headers: ["X-Api-Key": "4ea21ee288f24ae880ef13ebda15edbd"]).responseData { (response) in
                                
                                
                                if let data = response.result.value {
                                    do {
                                        let newsModel = try JSONDecoder().decode(NewsModel.self, from: data)
                                        if let articles = newsModel.articles {
                                            self.favoriteNews = articles
                                            
                                        }
                                        self.tableView.reloadData()
                                    } catch {
                                    }
                                }
            }
        }
    }
    
    

    
    
}
