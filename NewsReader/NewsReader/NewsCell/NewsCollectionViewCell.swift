//
//  NewsCollectionViewCell.swift
//  NewsReader
//
//  Created by alexey sorochan on 04.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import Kingfisher

protocol NewsCollectionCellDelegate {
    
    func didAddToFavorite(index: Int)
}

class NewsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var newNewsTextLabel: UILabel!
    @IBOutlet weak var addToFavoriteImageView: UIImageView!
    @IBOutlet weak var hotTextLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleTextLabel: UILabel!
    @IBOutlet weak var newsDescriptionTextLabel: UILabel!
    @IBOutlet weak var publishTextLabel: UILabel!
    
    var delegate: NewsCollectionCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func didTapAddToFavoritesActionButton(_ sender: Any) {
        delegate?.didAddToFavorite(index: tag)
    }
}

extension NewsCollectionViewCell {
    
    func updateCollectionNewsData(_ news: NewsArticleModel) {
        
        if news.favorite == true {
            addToFavoriteImageView.image = UIImage(systemName: "star.fill")
            debugPrint(news.favorite)
        } else {
            addToFavoriteImageView.image = UIImage(systemName: "star")
        }

        if let url = news.urlToImage {
            let imgUrl = URL(string: url)
            newsImageView.kf.setImage(with: imgUrl)
        } else {
            newsImageView.image = UIImage(named: "noImage")
        }

        newsTitleTextLabel.text = news.title ?? "-"
        newsDescriptionTextLabel.text = news.description ?? "-"

        if let date = news.publishedAt {
            publishTextLabel.text = convertDateToNorm(date)
        }
        didNewsNews(news.publishedAt ?? "")
    }
}


