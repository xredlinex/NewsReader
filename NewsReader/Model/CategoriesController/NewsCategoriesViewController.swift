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
}

extension NewsCategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if favoriteNews.isEmpty {
            return 1
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0:
            return newsCategories.count
        default:
            return favoriteNews.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section) {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesTableViewCell", for: indexPath) as! CategoriesTableViewCell
            cell.updateCategoriesName(newsCategories[indexPath.row])
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell", for: indexPath) as! FavoritesTableViewCell
            cell.updateFavoritesCell(favoriteNews[indexPath.row])
            return cell
        }
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
