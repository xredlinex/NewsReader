//
//  FavoritesTableViewCell.swift
//  NewsReader
//
//  Created by alexey sorochan on 04.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsTitleTextLabel: UILabel!
    
    @IBOutlet weak var newsDescriptionTextLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension FavoritesTableViewCell {
    
    func updateFavoritesCell(_ news: NewsArticleModel) {
        
        newsTitleTextLabel.text = news.title ?? "-"
        newsDescriptionTextLabel.text = news.description ?? "-"
    }
}
