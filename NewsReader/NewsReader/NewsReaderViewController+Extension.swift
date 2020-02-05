//
//  NewsReaderViewController+Extension.swift
//  NewsReader
//
//  Created by alexey sorochan on 04.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

extension NewsReaderViewController {
    
    func newsRequest(_ keyword: String) {
        
        parameters = ["q" : keyword,
                      "pageSize" : pageSize,
                      "page" : pageNumber]
        
        debugPrint(parameters)
        
        if !isLoading {
            
            let url = URL(string: "https://newsapi.org/v2/everything")
            if let recieveUrl = url {
                Alamofire.request(recieveUrl, method: .get,
                                  parameters: parameters,
                                  encoding: URLEncoding.default, 
                                  headers: ["X-Api-Key": "439c5ba63c944a2cac581d87e18fc759"]).responseData { (respomse) in
                    self.isLoading = true
                        if let date = respomse.result.value {
                            do {
                                let newsModel = try JSONDecoder().decode(NewsModel.self, from: date)
                                    if let articles = newsModel.articles {
                                        self.newsList.append(contentsOf: articles)
                                        debugPrint(articles.count)
                                    } else {
                                        self.showErrorAlert("news not found")
                                    }
                                    self.collectionView.reloadData()
                                } catch {
                                    self.showErrorAlert("news not found or thms else")
                                }
                            }
                }
            } else {
                showErrorAlert("fatal error")
            }
        }
    }
}
