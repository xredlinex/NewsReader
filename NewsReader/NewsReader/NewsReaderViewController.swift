//
//  NewsReaderViewController.swift
//  NewsReader
//
//  Created by alexey sorochan on 04.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class NewsReaderViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var newsList: [NewsArticleModel] = []
    var searchKeyword = String()
    var pageNumber = 1
    var pageSize = 10
    var maxcount = 100
    var isLoading = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(UINib(nibName: <#T##String#>, bundle: <#T##Bundle?#>), forCellWithReuseIdentifier: <#T##String#>)
        collectionView.reloadData()
    }
}


extension NewsReaderViewController {
    
    func newsRequest(_ parameters: [String : Any]) {
        
        if !isLoading {
            
            let url = URL(string: "https://newsapi.org/v2/everything")
            if let recieveUrl = url {
                Alamofire.request(recieveUrl, method: .get,
                                  parameters: parameters,
                                  encoding: URLEncoding.default,
                                  headers: ["X-Api-Key": "4ea21ee288f24ae880ef13ebda15edbd"]).responseData { (respomse) in
                    self.isLoading = true
                        if let date = respomse.result.value {
                            do {
                                let newsModel = try JSONDecoder().decode(NewsModel.self, from: date)
                                    if let articles = newsModel.articles {
                                        self.newsList.append(contentsOf: articles)
                                    } else {
                                        showErrorAlert("news not found")
                                    }
                                    self.collectionView.reloadData()
                                } catch {
                                    showErrorAlert("news not found or thms else")
                                }
                            }
                }
            } else {
                showErrorAlert("fatal error")
            }
        }
        
    }
}
