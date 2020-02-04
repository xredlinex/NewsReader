//
//  NewsCategoriesViewController+TableView.swift
//  NewsReader
//
//  Created by alexey sorochan on 04.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

extension NewsCategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if favoriteNews.isEmpty {
            return 1
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return newsCategories.count
        default:
            return favoriteNews.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section) {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesTableViewCell", for: indexPath) as! CategoriesTableViewCell
            cell.updateCategoriesName(newsCategories[indexPath.row])
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell", for: indexPath) as! FavoritesTableViewCell
            cell.updateFavoritesCell(favoriteNews[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
            let label = UILabel(frame: view.frame)
            label.font = UIFont.systemFont(ofSize: 15)
            label.textColor = UIColor.white
            label.backgroundColor = UIColor(red: 44/255, green: 47/255, blue: 53/255, alpha: 1)
            label.textAlignment = .center
            label.text = "Popular News Categories"
            view.addSubview(label)
            return view
        default:
            let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
            let label = UILabel(frame: view.frame)
            label.font = UIFont.systemFont(ofSize: 15)
            label.backgroundColor = UIColor(red: 44/255, green: 47/255, blue: 53/255, alpha: 1)
            label.textColor = UIColor.white
            label.textAlignment = .center
            label.text = "Favorite News"
            view.addSubview(label)
            return view
        }
    }
}
