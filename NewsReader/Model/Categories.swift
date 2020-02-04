//
//  Categories.swift
//  NewsReader
//
//  Created by alexey sorochan on 04.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class NewsCategories {
    var name: String?
    var keyword: String?
}

class MakeNewsCategories {
    func makeCat() -> [NewsCategories]{
        let sport = NewsCategories()
        sport.name = "Sport"
        sport.keyword = "sport"
        
        let political = NewsCategories()
        political.name = "Political"
        political.keyword = "political"
        
        let humman = NewsCategories()
        humman.name = "Humman"
        humman.keyword = "humman"
        
        let health = NewsCategories()
        health.name = "Health"
        health.keyword = "health"
        
        let technique = NewsCategories()
        technique.name = "Technique"
        technique.keyword = "tech"
        
        let weather = NewsCategories()
        weather.name = "Weather"
        weather.keyword = "weather"
        
        let crime = NewsCategories()
        crime.name = "Crime"
        crime.keyword = "crime"
        
        return [sport, political, humman, health, technique, weather, crime]
    }
}


class NewsReaderData {
    var categories: [NewsCategories]?
    var favoriteNews: [NewsArticleModel]?
}
