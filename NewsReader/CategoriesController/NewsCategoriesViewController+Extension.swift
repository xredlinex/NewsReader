//
//  NewsCategoriesViewController+Extension.swift
//  NewsReader
//
//  Created by alexey sorochan on 04.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

extension NewsCategoriesViewController: FavoriteTebleCellDelegate {
    func removeFromFavorite(index: Int) {
        favoriteList.remove(at: index)
        tableView.reloadData()
    }
}
