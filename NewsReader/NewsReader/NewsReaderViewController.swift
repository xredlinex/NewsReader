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
    var searchKeyword: String = ""
    var pageNumber = 1
    var pageSize = 10
    var maxcount = 100
    var isLoading = true
    var parameters: [String : Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
       newsRequest(searchKeyword)
        collectionView.register(UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewsCollectionViewCell")

//        collectionView.reloadData()
    }
}



