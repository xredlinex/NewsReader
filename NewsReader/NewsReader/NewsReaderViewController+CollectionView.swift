//
//  NewsReaderViewController+CollectionView.swift
//  NewsReader
//
//  Created by alexey sorochan on 04.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import CollectionViewWaterfallLayout

extension NewsReaderViewController: UICollectionViewDataSource, UICollectionViewDelegate, CollectionViewWaterfallLayoutDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as! NewsCollectionViewCell
        cell.updateCollectionNewsData(newsList[indexPath.row])
        cell.delegate = self
        cell.tag = indexPath.row
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        if let url = newsList[indexPath.row].url {
            viewController.url = url
            navigationController?.pushViewController(viewController, animated: true)
        } else {
            showErrorAlert("Sorry News Sourse Link")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if newsList.count < maxcount && indexPath.row >= newsList.count - 1 {
            pageNumber += 1
            isLoading = false
            self.newsRequest(searchKeyword)
        }
    }
 
    func collectionView(_ collectionView: UICollectionView, layout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let random = Int(arc4random_uniform((UInt32)(100)))
        let size = CGSize(width: collectionView.frame.width / 2 - 10, height: 400 + CGFloat(random))
        return size
    }
}




