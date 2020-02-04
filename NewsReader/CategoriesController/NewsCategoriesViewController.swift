//
//  NewsCategoriesViewController.swift
//  NewsReader
//
//  Created by alexey sorochan on 04.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class NewsCategoriesViewController: UIViewController {

    @IBOutlet weak var searchNewsTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!

    var newsCategories: [NewsCategories] = []
    var favoriteNews: [NewsArticleModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        getnews()
        newsCategories = MakeNewsCategories().makeCat()
        
        tableView.register(UINib(nibName: "CategoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoriesTableViewCell")
        tableView.register(UINib(nibName: "FavoritesTableViewCell", bundle: nil), forCellReuseIdentifier: "FavoritesTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    @IBAction func didTapSearchNewsActionButton(_ sender: Any) {
        
    }
    
}


