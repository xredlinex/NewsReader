//
//  WebViewController.swift
//  NewsReader
//
//  Created by alexey sorochan on 08.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var newsWebView: WKWebView!
    
    var url = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showActivityIndicator(indiText: "Loading Page")
        if let urlRecieve = URL(string: url) {
            let urlRequest = URLRequest(url: urlRecieve)
            newsWebView.load(urlRequest)
        } else {
            hideActivityIndicator()
            showErrorAlert("News Not Found")
            navigationController?.popViewController(animated: false)
        }
        newsWebView.navigationDelegate = self
    }
    
    @IBAction func didTapGoBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
}

extension WebViewController: WKNavigationDelegate {
 
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        hideActivityIndicator()
    }
}
