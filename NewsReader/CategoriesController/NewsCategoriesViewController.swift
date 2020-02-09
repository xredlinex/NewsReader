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
    var favoriteList: [NewsArticleModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newsCategories = MakeNewsCategories().makeCat()
        
        tableView.register(UINib(nibName: "CategoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoriesTableViewCell")
        tableView.register(UINib(nibName: "FavoritesTableViewCell", bundle: nil), forCellReuseIdentifier: "FavoritesTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        searchNewsTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        searchNewsTextField.text = ""
    }
    
    @IBAction func didTapSearchNewsActionButton(_ sender: Any) {
        if let keyword = searchNewsTextField.text, keyword != "" {
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewsReaderViewController") as! NewsReaderViewController
            viewController.searchKeyword = keyword
            viewController.favoriteList = favoriteList
            navigationController?.pushViewController(viewController, animated: true)
        } else {
            showErrorAlert("Enter Keyword")
        }
    }
}


