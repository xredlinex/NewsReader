//
//  NewsModel.swift
//  NewsReader
//
//  Created by alexey sorochan on 04.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class NewsModel: Mappable {
    
    var status: String?
    var totalResults: Int?
    var articles: [NewsArticlesSourseModel]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        status          <- map["status"]
        totalResults    <- map["totalResults"]
        articles        <- map["author"]
    }
}

class NewsArticlesModel: Mappable {
    var sourse: NewsArticlesSourseModel?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishAt: String?
    var content: String?
    var favoriteNews: Bool?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        sourse          <- map["sourse"]
        author          <- map["author"]
        title           <- map["title"]
        description     <- map["description"]
        url             <- map["url"]
        urlToImage      <- map["urlToImage"]
        publishAt       <- map["publishAt"]
        content         <- map["content"]
    }
}

class NewsArticlesSourseModel: Mappable {
    var id: String?
    var name: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id      <- map["id"]
        name    <- map["name"]
    }
}
