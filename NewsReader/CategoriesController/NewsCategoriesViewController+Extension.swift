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
        let alertController = UIAlertController(title: "Remove?", message: "Remove News Article From Favorite", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { (_) in
            self.favoriteList.remove(at: index)
            self.tableView.reloadData()
        }
        let alertCancel = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        alertController.addAction(alertAction)
        alertController.addAction(alertCancel)
        present(alertController, animated: true, completion: nil)
    }
}

extension NewsCategoriesViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchNewsTextField.resignFirstResponder()
        return true
    }
}
