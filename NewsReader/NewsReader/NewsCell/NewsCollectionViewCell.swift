//
//  NewsCollectionViewCell.swift
//  NewsReader
//
//  Created by alexey sorochan on 04.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import Kingfisher

class NewsCollectionViewCell: UICollectionViewCell {
    
//    @IBOutlet weak var addToFavoriteImageView: UIImageView!
//    @IBOutlet weak var hotTextLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleTextLabel: UILabel!
    @IBOutlet weak var newsDescriptionTextLabel: UILabel!
    @IBOutlet weak var publishTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }


    @IBAction func didTapAddToFavoritesActionButton(_ sender: Any) {
    }
}


extension NewsCollectionViewCell {
    
    func updateCollectionNewsData(_ news: NewsArticleModel) {

        
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
    }
}


extension NewsCollectionViewCell {

    func convertDateToNorm(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .iso8601)
        dateFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ssZ"
        let format = DateFormatter()
        format.dateFormat = "dd / MMM / yyyy hh:mm a"
        if let date = dateFormatter.date(from: dateString) {
            return format.string(from: date)
        } else {
            return "-huhh-"
        }
    }
}


