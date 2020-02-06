//
//  FavoritesTableViewCell.swift
//  NewsReader
//
//  Created by alexey sorochan on 04.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import Kingfisher

protocol FavoriteTebleCellDelegate {
    func removeFromFavorite(index: Int)
}

class FavoritesTableViewCell: UITableViewCell {
    

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleTextLabel: UILabel!
    @IBOutlet weak var newsDescriptionTextLabel: UILabel!
    
    var delegate: FavoriteTebleCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func didTapRemoveFavoriteActionButton(_ sender: Any) {
        delegate?.removeFromFavorite(index: tag)
        
    }
    
}


extension FavoritesTableViewCell {
    
    func updateFavoritesCell(_ news: NewsArticleModel) {
        if let url = news.urlToImage {
            let imgURL = URL(string: url)
            newsImageView.kf.setImage(with: imgURL)
        }
        
        newsTitleTextLabel.text = news.title ?? "-"
        newsDescriptionTextLabel.text = news.description ?? "-"
    }
}
