//
//  NewsCategoriesViewController.swift
//  NewsReader
//
//  Created by alexey sorochan on 04.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class NewsCategoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var newsCategories: [NewsCategories]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsCategories = MakeNewsCategories().makeCat()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }


}

extension NewsCategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    
}
