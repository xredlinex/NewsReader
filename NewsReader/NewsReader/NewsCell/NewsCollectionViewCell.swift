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

extension NewsCollectionViewCell {
    
    func didNewsNews(_ publishAt: String) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .iso8601)
        dateFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ssZ"
        let calendar = Calendar.current
        
        guard let dateNews = dateFormatter.date(from: publishAt) else { return }
        
        if calendar.isDateInToday(dateNews) || calendar.isDateInYesterday(dateNews) {
            newNewsTextLabel.isHidden = false
            newNewsTextLabel.text = "NEW"
            newNewsTextLabel.clipsToBounds = true
            newNewsTextLabel.layer.cornerRadius = 6
            newNewsTextLabel.textColor = UIColor.white
            newNewsTextLabel.backgroundColor = UIColor.red
        } else {
            newNewsTextLabel.isHidden = true
        }
    }
}
