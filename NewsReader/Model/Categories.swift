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
        
        let political = NewsCategories()
        political.name = "Political"
        
        let humman = NewsCategories()
        humman.name = "Humman"
        
        let health = NewsCategories()
        health.name = "Health"
        
        let technique = NewsCategories()
        technique.name = "Technique"
        
        let weather = NewsCategories()
        weather.name = "Weather"
        
        let crime = NewsCategories()
        crime.name = "Crime"
        
        return [sport, political, humman, health, technique, weather, crime]
    }
}


class NewsReaderData {
    var categories: [NewsCategories]?
    var favoriteNews: [NewsArticleModel]?
}
