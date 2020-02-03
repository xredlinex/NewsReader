//
//  CategoriesTableViewCell.swift
//  NewsReader
//
//  Created by alexey sorochan on 04.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {

  
    @IBOutlet weak var newsCategoriesNameTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension CategoriesTableViewCell {
    
    func updateCategoriesName(_ newsCategories: NewsCategories) {
        
        newsCategoriesNameTextLabel.text = newsCategories.name ?? "-"
    }
}
