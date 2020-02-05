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
    var searchKeyword: String = ""
    var pageNumber = 1
    var pageSize = 10
    var maxcount = 100
    var isLoading = true
    var parameters: [String : Any] = [:]
    

    
//
//    var columnCount: Int = 2
//    var minimumColumnSpacing: Float = 10.0
//    var minimumInteritemSpacing: Float = 10.0
//    var headerHeight: Float = 0.0
//    var footerHeight: Float = 0.0
//    var headerInset: UIEdgeInsets = .zero
//    var footerInset: UIEdgeInsets = .zero
//    var sectionInset: UIEdgeInsets = .zero
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = CollectionViewWaterfallLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.headerInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        layout.headerHeight = 50
        layout.footerHeight = 20
        layout.minimumColumnSpacing = 10
        layout.minimumInteritemSpacing = 10
        

        collectionView.collectionViewLayout = layout
        
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }

        

    

        collectionView.register(UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewsCollectionViewCell")
        if newsList.isEmpty {
            isLoading = false
            newsRequest(searchKeyword)
        }
        
        
        

    }
    
    
    
    @IBAction func didTapGoBackButtonActionButton(_ sender: Any) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewsCategoriesViewController") as! NewsCategoriesViewController
        navigationController?.pushViewController(viewController, animated: false)
        
    }
}


    

