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
    
    func newsRequest(_ keyword: String, sortByDate: Bool? = nil, sortByPop: Bool? = nil) {
    
        showActivityIndicator(indiText: "Loading News")
        
        var sort = String()
        if sortByDate == true {
            sort = "publishedAt"
            debugPrint("sort by date")
        } else if sortByPop == true {
            sort = "popularity"
            debugPrint("sort by pop")
        } else {
            sort = "relevancy"
            debugPrint("defaukt")
        }
        
        parameters = ["q" : keyword,
                      "pageSize" : pageSize,
                      "page" : pageNumber,
                      "sortBy" : sort]
        debugPrint(parameters)
        if !isLoading {
            let url = URL(string: "https://newsapi.org/v2/everything")
            if let recieveUrl = url {
                Alamofire.request(recieveUrl, method: .get,
                                  parameters: parameters,
                                  encoding: URLEncoding.default,
//          use this api key                         439c5ba63c944a2cac581d87e18fc759
                                  headers: ["X-Api-Key": "453990a8d4b841aaa5096d649b8134c8"]).responseData { (respomse) in
                    self.isLoading = true
                        if let date = respomse.result.value {
                            do {
                                let newsModel = try JSONDecoder().decode(NewsModel.self, from: date)
                                    if let articles = newsModel.articles {
                                        if articles.count != 0 {
                                            debugPrint(articles.count)
                                            self.newsList.append(contentsOf: articles)
                                            self.checkForFavorite()
                                        } else {
                                            self.showNilAlert("News not Found")
                                        }
                                    } else {
                                        self.showNilAlert("Server Error")
                                    }
                                self.hideActivityIndicator()
                                self.collectionView.reloadData()
                                } catch {
                                    self.showNilAlert("News not Found or thmth else")
                                }
                        } else {
                            self.showErrorAlert("No News")
                    }
                }
            } else {
                showNilAlert("Fatal Errrorrrrr")
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

extension NewsReaderViewController {
    
    func sortNewsAlertSheet(_ keyword: String) {
        let alertController = UIAlertController(title: "Sort News By", message: nil, preferredStyle: .actionSheet)
        let sortByDateAction = UIAlertAction(title: "sort by date", style: .default) { (_) in
            self.newsList.removeAll()
            self.isLoading = false
            self.newsRequest(keyword, sortByDate: true)
        }
        let sortByPopularity = UIAlertAction(title: "sort by popularity", style: .default) { (_) in
            self.newsList.removeAll()
            self.isLoading = false
            self.newsRequest(keyword, sortByPop: true)
        }
        let sortByTitleAction = UIAlertAction(title: "sort by title (default)", style: .default) { (_) in
            self.newsList.removeAll()
            self.isLoading = false
            self.newsRequest(keyword)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        alertController.addAction(sortByDateAction)
        alertController.addAction(sortByPopularity)
        alertController.addAction(sortByTitleAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion:  nil)
    }
}
