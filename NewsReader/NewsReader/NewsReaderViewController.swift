//
//  NewsReaderViewController.swift
//  NewsReader
//
//  Created by alexey sorochan on 04.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class NewsReaderViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var searchKeyword = String()
    var newsList: [NewsArticleModel] = []
    
    var isLoading: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}


extension NewsReaderViewController {
    
    func newsRequest(_ parameters: [String : Any]) {
        
        if !isLoading {
            
        }
        
    }
    
    
    
}
