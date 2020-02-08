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
        showActivityIndicator(indiText: "Loading News")
        parameters = ["q" : keyword,
                      "pageSize" : pageSize,
                      "page" : pageNumber,
                      "sortBy" : "relevancy"]
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
                                        self.checkForFavorite()
                                    } else {
                                        self.showErrorAlert("news not found")
                                    }
                                self.hideActivityIndicator()
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


extension NewsReaderViewController: NewsCollectionCellDelegate {
    
    func didAddToFavorite(index: Int) {

        if favoriteList.contains(where: { $0.publishedAt == newsList[index].publishedAt && $0.title == newsList[index].title}) {
            favoriteList.removeAll(where: { $0.publishedAt == newsList[index].publishedAt && $0.title == newsList[index].title})
            newsList[index].favorite = false
        } else {
            newsList[index].favorite = true
            favoriteList.append(newsList[index])
        }
        collectionView.reloadData()
    }
}
