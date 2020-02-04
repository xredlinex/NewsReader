//
//  NewsRequest.swift
//  NewsReader
//
//  Created by alexey sorochan on 04.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper


class SearchNews: UIViewController {
    
    func newsRequest(_ parameters: [String : Any] ,_ isLoadin: Bool ) {
        
        var news: [NewsArticleModel] = []
        
        if !isEditing {
            let url = URL(string: "https://newsapi.org/v2/everything")
            
            if let urlCorrect = url {
                Alamofire.request(urlCorrect,
                                  method: .get,
                                  parameters: parameters,
                                  encoding: URLEncoding.default,
                                  headers: ["X-Api-Key": "4ea21ee288f24ae880ef13ebda15edbd"]).responseData { (response) in
                                    self.isEditing = true
                                    if let data = response.result.value {
                                        do {
                                            let newsModel = try JSONDecoder().decode(NewsModel.self, from: data)
                                            if let articles = newsModel.articles {
                                                news.append(contentsOf: articles)
                                            } else {
                                                self.showErrorAlert("no articles found")
                                            }
                                            
                                        } catch {
                                            self.showErrorAlert("error")
                                        }
                                    } else {
                                        self.showErrorAlert("no data found")
                                    }
                                    
                }
                
            } else {
                showErrorAlert("error")
            }
        }
    }
}
