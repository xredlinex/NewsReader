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
import CollectionViewWaterfallLayout

class NewsReaderViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var newsList: [NewsArticleModel] = []
    var favoriteList: [NewsArticleModel] = []
    var searchKeyword: String = ""
    var pageNumber = 1
    var pageSize = 10
    var maxcount = 100
    var isLoading = true
    var parameters: [String : Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkForFavorite()
        
        let layout = CollectionViewWaterfallLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        layout.minimumColumnSpacing = 10
        layout.minimumInteritemSpacing = 10
        collectionView.collectionViewLayout = layout
    
        collectionView.register(UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewsCollectionViewCell")
    
        if newsList.isEmpty {
            isLoading = false
            newsRequest(searchKeyword)
        } else {
            navigationController?.popViewController(animated: false)
        }
    }
    
    @IBAction func didTapGoBackButtonActionButton(_ sender: Any) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewsCategoriesViewController") as! NewsCategoriesViewController
        viewController.favoriteList = favoriteList
        navigationController?.pushViewController(viewController, animated: false)
    }
    
    @IBAction func didTapSortNewsActionButton(_ sender: Any) {
        sortNewsAlertSheet(searchKeyword)
    }
}

extension NewsReaderViewController {
    
    func checkForFavorite() {
        for news in newsList {
            if favoriteList.contains(where: { $0.publishedAt == news.publishedAt && $0.title == news.title}) {
                news.favorite = true
            }
        }
    }
}

    

