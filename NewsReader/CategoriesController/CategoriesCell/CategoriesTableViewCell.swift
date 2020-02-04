//
//  CategoriesTableViewCell.swift
//  NewsReader
//
//  Created by alexey sorochan on 04.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {

  
    @IBOutlet weak var newsView: UIView!
    @IBOutlet weak var newsCategoriesNameTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}


extension CategoriesTableViewCell {
    
    func updateCategoriesName(_ newsCategories: NewsCategories) {
        
        newsCategoriesNameTextLabel.text = newsCategories.name ?? "-"
        
        newsView.clipsToBounds = true
        newsView.layer.cornerRadius = 12
        
    }
}
