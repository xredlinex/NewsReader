//
//  NewsCollectionViewCell+Extension.swift
//  NewsReader
//
//  Created by alexey sorochan on 09.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation

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
            newNewsTextLabel.textColor = .white
            newNewsTextLabel.backgroundColor = .red
        } else {
            newNewsTextLabel.isHidden = true
        }
    }
}
